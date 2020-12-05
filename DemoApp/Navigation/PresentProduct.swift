import DI
import Navigation
import UIKit

struct PresentProduct: Navigation.Action {
  var id: Int
  var animated: Bool = true
}

/// Pushes product screen on navigation stack of currently selected tab.
/// If the screen is already presented on top of the navigation stack, does nothing.
struct PresentProductNavigator: TypedNavigator {
  @Dependency var tabs: () -> TabsViewControlling?
  @Dependency var navigator: Navigator

  func perform(_ action: PresentProduct, completion: @escaping () -> Void) {
    guard let tabs = self.tabs() else { return }
    let navigationController = tabs.navigationController(for: tabs.selectedTab)
    if let viewController = navigationController.topViewController as? ProductViewController,
       viewController.productId == action.id {
      completion()
      return
    }
    let viewController = ProductViewController(productId: action.id)
    let pushAction = Push(viewController, on: navigationController, animated: action.animated)
    navigator.perform(pushAction, completion: completion)
  }
}
