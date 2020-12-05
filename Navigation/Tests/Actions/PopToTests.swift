import XCTest
@testable import Navigation

final class PopToTests: XCTestCase {
  var action: PopTo!
  var navigator: PopToNavigator!
  var viewController: UIViewController!
  private var navigationController: NavigationControllerDouble!
  var didComplete: Bool!

  override func setUp() {
    viewController = UIViewController()
    navigationController = NavigationControllerDouble()
    action = PopTo(viewController, on: navigationController)
    navigator = PopToNavigator()
    didComplete = false
  }

  override func tearDown() {
    action = nil
    navigator = nil
    viewController = nil
    navigationController = nil
    didComplete = nil
  }

  func testPopToAnimated() {
    action.animated = true
    navigator.perform(action) { self.didComplete = true }

    XCTAssert(navigationController.didPopToViewController === viewController)
    XCTAssert(navigationController.didPopAnimated == true)
    XCTAssertTrue(navigationController.transitionCoordinatorDouble.didAnimate)

    navigationController.transitionCoordinatorDouble.animationCompletion?(TransitionCoordinatorDouble())

    XCTAssertTrue(didComplete)
  }

  func testPopToNotAnimated() {
    action.animated = false
    navigator.perform(action) { self.didComplete = true }

    XCTAssert(navigationController.didPopToViewController === viewController)
    XCTAssert(navigationController.didPopAnimated == false)
    XCTAssertTrue(didComplete)
  }
}

private final class NavigationControllerDouble: UINavigationController {
  var didPopToViewController: UIViewController?
  var didPopAnimated: Bool?
  let transitionCoordinatorDouble = TransitionCoordinatorDouble()

  override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
    didPopToViewController = viewController
    didPopAnimated = animated
    return nil
  }

  override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
    transitionCoordinatorDouble
  }
}
