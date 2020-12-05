import XCTest
@testable import Navigation

final class DismissModalTests: XCTestCase {
  private var parent: ParentViewControllerDouble!
  var action: DismissModal!
  var navigator: DismissModalNavigator!
  var didComplete: Bool!

  override func setUp() {
    parent = ParentViewControllerDouble()
    didComplete = false
    action = DismissModal(from: parent)
    navigator = DismissModalNavigator()
  }

  override func tearDown() {
    parent = nil
    action = nil
    navigator = nil
    didComplete = nil
  }

  func testDismissAnimated() {
    action.animated = true
    navigator.perform(action) { self.didComplete = true }

    XCTAssert(parent.didDismissAnimated == true)

    parent.dismissCompletion?()

    XCTAssertTrue(didComplete)
  }

  func testDismissNotAnimated() {
    action.animated = false
    navigator.perform(action) { self.didComplete = true }

    XCTAssert(parent.didDismissAnimated == false)

    parent.dismissCompletion?()

    XCTAssertTrue(didComplete)
  }
}

private class ParentViewControllerDouble: UIViewController {
  var didDismissAnimated: Bool?
  var dismissCompletion: (() -> Void)?

  override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
    didDismissAnimated = flag
    dismissCompletion = completion
  }
}
