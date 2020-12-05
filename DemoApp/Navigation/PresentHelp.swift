import DI
import Navigation
import UIKit

struct PresentHelp: Navigation.Action {
  var animated: Bool = true
}

/// Presents help screen on profile's tab navigation stack.
/// If help screen is already on the stack, pops the stack to the screen.
/// If help screen is not on the stack, pushes the screen from stack's root.
struct PresentHelpNavigator: TypedNavigator {
  @Dependency var tabs: () -> TabsViewControlling?
  @Dependency var navigator: Navigator

  func perform(_ action: PresentHelp, completion: @escaping () -> Void) {
    guard let tabs = self.tabs() else { return }
    tabs.selectedTab = .profile
    let navigationController = tabs.navigationController(for: .profile)
    let navigationAction: Action
    if let viewController = navigationController.viewControllers.first(where: { $0 is HelpViewController }) {
      navigationAction = PopTo(viewController, on: navigationController, animated: action.animated)
    } else {
      let viewController = HelpViewController()
      let viewControllers = Array(navigationController.viewControllers.prefix(1)) + [viewController]
      navigationAction = SetStack(viewControllers, on: navigationController, animated: action.animated)
    }
    navigator.perform(navigationAction, completion: completion)
  }
}
