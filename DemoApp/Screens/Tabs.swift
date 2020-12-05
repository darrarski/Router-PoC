import UIKit

enum Tab: Equatable, CaseIterable {
  case home
  case categories
  case observed
  case cart
  case profile
}

protocol TabsViewControlling: UIViewController {
  var selectedTab: Tab { get set }
  func navigationController(for tab: Tab) -> UINavigationController
}

final class TabsViewController: UITabBarController {
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) { nil }

  override func viewDidLoad() {
    super.viewDidLoad()
    viewControllers = Tab.allCases.map(makeNavigationController(for:))
  }

  private func index(for tab: Tab) -> Int {
    Tab.allCases.firstIndex(of: tab)!
  }

  private func makeNavigationController(for tab: Tab) -> UINavigationController {
    let navigationController = UINavigationController()
    navigationController.viewControllers = [makeRootViewController(for: tab)]
    navigationController.tabBarItem = makeTabBarItem(for: tab)
    return navigationController
  }

  private func makeRootViewController(for tab: Tab) -> UIViewController {
    switch tab {
    case .home:
      return HomeViewController()

    case .categories:
      return CategoriesViewController()

    case .observed:
      return ObservedViewController()

    case .cart:
      return CartViewController()

    case .profile:
      return ProfileViewController()
    }
  }

  private func makeTabBarItem(for tab: Tab) -> UITabBarItem {
    switch tab {
    case .home:
      return UITabBarItem(
        title: "Home",
        image: UIImage(systemName: "house"),
        selectedImage: UIImage(systemName: "house.fill")
      )
    case .categories:
      return UITabBarItem(
        title: "Categories",
        image: UIImage(systemName: "text.magnifyingglass"),
        selectedImage: nil
      )
    case .observed:
      return UITabBarItem(
        title: "Observed",
        image: UIImage(systemName: "eye"),
        selectedImage: UIImage(systemName: "eye.fill")
      )
    case .cart:
      return UITabBarItem(
        title: "Cart",
        image: UIImage(systemName: "cart"),
        selectedImage: UIImage(systemName: "cart.fill")
      )
    case .profile:
      return UITabBarItem(
        title: "Profile",
        image: UIImage(systemName: "person"),
        selectedImage: UIImage(systemName: "person.fill")
      )
    }
  }
}

extension TabsViewController: TabsViewControlling {
  var selectedTab: Tab {
    get { Tab.allCases[selectedIndex] }
    set { selectedIndex = index(for: newValue) }
  }

  func navigationController(for tab: Tab) -> UINavigationController {
    viewControllers?[index(for: tab)] as! UINavigationController
  }
}
