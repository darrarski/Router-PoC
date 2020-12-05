import XCTest
@testable import Navigation

final class CombinedNavigatorTests: XCTestCase {
  class TestAction: Navigation.Action {}

  class TestNavigator: Navigation.TypedNavigator {
    var didPerformAction: TestAction?
    var completion: (() -> Void)?

    func perform(_ action: TestAction, completion: @escaping () -> Void) {
      didPerformAction = action
      self.completion = completion
    }
  }

  struct OtherNavigator: Navigator {
    func canPerform(_ action: Action) -> Bool { false }
    func perform(_ action: Action, completion: @escaping () -> Void) {}
  }

  func testPerformAction() {
    let navigator = TestNavigator()
    let action = TestAction()
    let sut = CombinedNavigator(
      OtherNavigator(),
      navigator,
      OtherNavigator()
    )
    var didComplete = false
    sut.perform(action, completion: { didComplete = true })

    XCTAssert(navigator.didPerformAction === action)

    navigator.completion?()

    XCTAssertTrue(didComplete)
  }

  func testPerformActionWithoutNavigator() {
    var sut = CombinedNavigator(
      OtherNavigator()
    )
    var didFailWithMessage: String?
    sut.assertionFailure = { message, _, _ in
      didFailWithMessage = message()
    }
    let action = TestAction()
    sut.perform(action)

    XCTAssertEqual(
      didFailWithMessage,
      "No navigator to perform action: \(action)"
    )
  }

  func testPerformActionWithMultipleNavigators() {
    let navigators = [TestNavigator(), TestNavigator()]
    var sut = CombinedNavigator(navigators)
    var didFailWithMessage: String?
    sut.assertionFailure = { message, _, _ in
      didFailWithMessage = message()
    }
    let action = TestAction()
    sut.perform(action)

    XCTAssertEqual(
      didFailWithMessage,
      "Multiple navigators can perform action: \(action), \(navigators)"
    )
    XCTAssertTrue(navigators.compactMap(\.didPerformAction).isEmpty)
  }
}
