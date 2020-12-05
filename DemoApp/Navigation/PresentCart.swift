import DI
import Navigation
import UIKit

struct PresentCart: Navigation.Action {
  var animated: Bool = true
}

/// Select cart tab and pop to root view controller
struct PresentCartNavigator: TypedNavigator {
  @Dependency var tabs: () -> TabsViewControlling?
  @Dependency var navigator: Navigator

  func perform(_ action: PresentCart, completion: @escaping () -> Void) {
    guard let tabs = self.tabs() else { return }
    tabs.selectedTab = .cart
    let navigationController = tabs.navigationController(for: .cart)
    let popAction = PopToRoot(on: navigationController, animated: action.animated)
    navigator.perform(popAction, completion: completion)
  }
}
