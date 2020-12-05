import DI
import Navigation
import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  @Dependency var navigator: Navigator
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    setupContainer()

    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = TabsViewController()
    window?.makeKeyAndVisible()

    return true
  }

  func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
  ) -> Bool {
    // To test deep link handling, run the app in simulator and execute command in terminal:
    // > xcrun simctl openurl booted {deep-link-url}
    // For example:
    // > xcrun simctl openurl booted "router-demo://p/2?rating=3"

    if let link = ProductRatingDeepLink(with: url) {
      navigator.perform(PresentProductRating(productId: link.id, rate: link.rate))
      return true
    }

    return false
  }

  func setupContainer() {
    let container = DI.Container.shared
    container.register({ [weak self] in
      self?.window?.rootViewController as? TabsViewControlling
    })
    container.register(CombinedNavigator(
      // Generic navigators (defined in Navigation package):
      PresentModalNavigator(),
      DismissModalNavigator(),
      PushNavigator(),
      PopToRootNavigator(),
      PopToNavigator(),
      SetStackNavigator(),

      // DemoApp navigators:
      PresentCartNavigator(),
      PresentCategoryNavigator(),
      PresentCheckoutNavigator(),
      PresentContactNavigator(),
      PresentHelpNavigator(),
      PresentProductNavigator(),
      PresentProductRatingNavigator(),
      PresentSettingsNavigator()
    ) as Navigator)
  }
}
