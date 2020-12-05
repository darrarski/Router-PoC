import DI
import Navigation
import UIKit

struct PresentCategory: Navigation.Action {
  var id: Int
  var animated: Bool = true
}

/// Pushes category screen on navigation stack of currently selected tab.
struct PresentCategoryNavigator: TypedNavigator {
  @Dependency var tabs: () -> TabsViewControlling?
  @Dependency var navigator: Navigator

  func perform(_ action: PresentCategory, completion: @escaping () -> Void) {
    guard let tabs = self.tabs() else { return }
    let navigationController = tabs.navigationController(for: tabs.selectedTab)
    let viewController = CategoryViewController(categoryId: action.id)
    let pushAction = Push(viewController, on: navigationController, animated: action.animated)
    navigator.perform(pushAction, completion: completion)
  }
}
