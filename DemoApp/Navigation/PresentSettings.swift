import DI
import Navigation
import UIKit

struct PresentSettings: Navigation.Action {
  var animated: Bool = true
}

/// Presents settings screen on profile's tab navigation stack.
/// If settings screen is already on the stack, pops the stack to the screen.
/// If settings screen is not on the stack, pushes the screen from stack's root.
struct PresentSettingsNavigator: TypedNavigator {
  @Dependency var tabs: () -> TabsViewControlling?
  @Dependency var navigator: Navigator

  func perform(_ action: PresentSettings, completion: @escaping () -> Void) {
    guard let tabs = self.tabs() else { return }
    tabs.selectedTab = .profile
    let navigationController = tabs.navigationController(for: .profile)
    let navigationAction: Action
    if let viewController = navigationController.viewControllers.first(where: { $0 is SettingsViewController }) {
      navigationAction = PopTo(viewController, on: navigationController, animated: action.animated)
    } else {
      let viewController = SettingsViewController()
      let viewControllers = Array(navigationController.viewControllers.prefix(1)) + [viewController]
      navigationAction = SetStack(viewControllers, on: navigationController, animated: action.animated)
    }
    navigator.perform(navigationAction, completion: completion)
  }
}
