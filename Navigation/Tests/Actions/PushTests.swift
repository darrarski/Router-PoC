import XCTest
@testable import Navigation

final class PushTests: XCTestCase {
  var viewController: UIViewController!
  private var navigationController: NavigationControllerDouble!
  var didComplete: Bool!
  var action: Push!
  var navigator: PushNavigator!

  override func setUp() {
    viewController = UIViewController()
    navigationController = NavigationControllerDouble()
    didComplete = false
    action = Push(viewController, on: navigationController)
    navigator = PushNavigator()
  }

  override func tearDown() {
    viewController = nil
    navigationController = nil
    didComplete = nil
    action = nil
    navigator = nil
  }

  func testPushAnimated() {
    action.animated = true
    navigator.perform(action) { self.didComplete = true }

    XCTAssert(navigationController.didPushViewController === viewController)
    XCTAssert(navigationController.didPushAnimated == true)
    XCTAssertTrue(navigationController.transitionCoordinatorDouble.didAnimate)

    navigationController.transitionCoordinatorDouble.animationCompletion?(TransitionCoordinatorDouble())

    XCTAssertTrue(didComplete)
  }

  func testPushNotAnimated() {
    action.animated = false
    navigator.perform(action) { self.didComplete = true }

    XCTAssert(navigationController.didPushViewController === viewController)
    XCTAssert(navigationController.didPushAnimated == false)
    XCTAssertTrue(didComplete)
  }
}

private final class NavigationControllerDouble: UINavigationController {
  var didPushViewController: UIViewController?
  var didPushAnimated: Bool?
  let transitionCoordinatorDouble = TransitionCoordinatorDouble()

  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    didPushViewController = viewController
    didPushAnimated = animated
  }

  override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
    transitionCoordinatorDouble
  }
}
