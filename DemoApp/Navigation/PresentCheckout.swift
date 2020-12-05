import DI
import Navigation
import UIKit

struct PresentCheckout: Navigation.Action {
  var animated: Bool = true
}

/// Presents checkout screen on cart's tab navigation stack.
/// If checkout screen is already on the stack, pops the stack to the screen.
/// If checkout screen is not on the stack, pushes the screen from stack's root.
struct PresentCheckoutNavigator: TypedNavigator {
  @Dependency var tabs: () -> TabsViewControlling?
  @Dependency var navigator: Navigator

  func perform(_ action: PresentCheckout, completion: @escaping () -> Void) {
    guard let tabs = self.tabs() else { return }
    tabs.selectedTab = .cart
    let navigationController = tabs.navigationController(for: .cart)
    let navigationAction: Action
    if let viewController = navigationController.viewControllers.first(where: { $0 is CheckoutViewController }) {
      navigationAction = PopTo(viewController, on: navigationController, animated: action.animated)
    } else {
      let viewController = CheckoutViewController()
      let viewControllers = Array(navigationController.viewControllers.prefix(1)) + [viewController]
      navigationAction = SetStack(viewControllers, on: navigationController, animated: action.animated)
    }
    navigator.perform(navigationAction, completion: completion)
  }
}
