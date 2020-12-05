import XCTest
@testable import Navigation

final class SetStackTests: XCTestCase {
  var action: SetStack!
  var navigator: SetStackNavigator!
  var viewControllers: [UIViewController]!
  private var navigationController: NavigationControllerDouble!
  var didComplete: Bool!

  override func setUp() {
    viewControllers = [UIViewController(), UIViewController()]
    navigationController = NavigationControllerDouble()
    action = SetStack(viewControllers, on: navigationController)
    navigator = SetStackNavigator()
    didComplete = false
  }

  override func tearDown() {
    action = nil
    navigator = nil
    viewControllers = nil
    navigationController = nil
    didComplete = nil
  }

  func testSetStackAnimated() {
    action.animated = true
    navigator.perform(action) { self.didComplete = true }

    XCTAssertEqual(navigationController.didSetViewControllers, viewControllers)
    XCTAssert(navigationController.didSetAnimated == true)
    XCTAssertTrue(navigationController.transitionCoordinatorDouble.didAnimate)

    navigationController.transitionCoordinatorDouble.animationCompletion?(TransitionCoordinatorDouble())

    XCTAssertTrue(didComplete)
  }

  func testSetStackNotAnimated() {
    action.animated = false
    navigator.perform(action) { self.didComplete = true }

    XCTAssertEqual(navigationController.didSetViewControllers, viewControllers)
    XCTAssert(navigationController.didSetAnimated == false)
    XCTAssertTrue(didComplete)
  }
}

private final class NavigationControllerDouble: UINavigationController {
  var didSetViewControllers: [UIViewController]?
  var didSetAnimated: Bool?
  let transitionCoordinatorDouble = TransitionCoordinatorDouble()

  override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
    didSetViewControllers = viewControllers
    didSetAnimated = animated
  }

  override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
    transitionCoordinatorDouble
  }
}
