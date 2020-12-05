import XCTest
@testable import Navigation

final class TypedNavigatorTests: XCTestCase {
  class TestAction: Navigation.Action {}

  class TestNavigator: Navigation.TypedNavigator {
    var didPerform: TestAction?
    var completion: (() -> Void)?

    func perform(_ action: TestAction, completion: @escaping () -> Void) {
      didPerform = action
      self.completion = completion
    }
  }

  func testCanPerformAction() {
    let navigator = TestNavigator()
    struct SomeAction: Navigation.Action {}

    XCTAssertFalse(navigator.canPerform(SomeAction()))
    XCTAssertTrue(navigator.canPerform(TestAction()))
  }

  func testPerformAction() {
    let navigator = TestNavigator()
    let action = TestAction()
    var didComplete = false
    navigator.perform(action, completion: { didComplete = true })

    XCTAssert(navigator.didPerform === action)

    navigator.completion?()

    XCTAssertTrue(didComplete)
  }
}
