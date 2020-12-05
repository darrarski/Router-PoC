import XCTest
@testable import Navigation

final class PopToRootTests: XCTestCase {
  var action: PopToRoot!
  var navigator: PopToRootNavigator!
  private var navigationController: NavigationControllerDouble!
  var didComplete: Bool!

  override func setUp() {
    navigationController = NavigationControllerDouble()
    action = PopToRoot(on: navigationController)
    navigator = PopToRootNavigator()
    didComplete = false
  }

  override func tearDown() {
    action = nil
    navigator = nil
    navigationController = nil
    didComplete = nil
  }

  func testPopToRootAnimated() {
    action.animated = true
    navigator.perform(action, completion: { self.didComplete = true })

    XCTAssert(navigationController.didPopToRootAnimated == true)

    XCTAssertTrue(navigationController.transitionCoordinatorDouble.didAnimate)

    navigationController.transitionCoordinatorDouble.animationCompletion?(TransitionCoordinatorDouble())

    XCTAssertTrue(didComplete)
  }

  func testPopToRootNotAnimated() {
    action.animated = false
    navigator.perform(action, completion: { self.didComplete = true })

    XCTAssert(navigationController.didPopToRootAnimated == false)
    XCTAssertTrue(didComplete)
  }
}

private final class NavigationControllerDouble: UINavigationController {
  var didPopToRootAnimated: Bool?
  let transitionCoordinatorDouble = TransitionCoordinatorDouble()

  override func popToRootViewController(animated: Bool) -> [UIViewController]? {
    didPopToRootAnimated = animated
    return nil
  }

  override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
    transitionCoordinatorDouble
  }
}
