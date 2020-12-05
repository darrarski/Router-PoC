import XCTest
@testable import Navigation

final class PresentModalTests: XCTestCase {
  var viewController: UIViewController!
  private var parent: ParentViewControllerDouble!
  var action: PresentModal!
  var navigator: PresentModalNavigator!
  var didComplete: Bool!

  override func setUp() {
    viewController = UIViewController()
    parent = ParentViewControllerDouble()
    didComplete = false
    action = PresentModal(viewController, from: parent)
    navigator = PresentModalNavigator()
  }

  override func tearDown() {
    viewController = nil
    parent = nil
    action = nil
    navigator = nil
    didComplete = nil
  }

  func testPresentModalAnimated() {
    action.animated = true
    navigator.perform(action) { self.didComplete = true }

    XCTAssert(parent.didPresent === viewController)
    XCTAssert(parent.didPresentAnimated == true)

    parent.presentCompletion?()

    XCTAssertTrue(didComplete)
  }

  func testPresentModalNotAnimated() {
    action.animated = false
    navigator.perform(action) { self.didComplete = true }

    XCTAssert(parent.didPresent === viewController)
    XCTAssert(parent.didPresentAnimated == false)

    parent.presentCompletion?()

    XCTAssertTrue(didComplete)
  }
}

private class ParentViewControllerDouble: UIViewController {
  var didPresent: UIViewController?
  var didPresentAnimated: Bool?
  var presentCompletion: (() -> Void)?

  override func present(
    _ viewControllerToPresent: UIViewController,
    animated flag: Bool,
    completion: (() -> Void)? = nil
  ) {
    didPresent = viewControllerToPresent
    didPresentAnimated = flag
    presentCompletion = completion
  }
}
