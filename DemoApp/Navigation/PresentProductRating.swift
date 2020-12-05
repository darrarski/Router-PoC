import DI
import UIKit
import Navigation

struct PresentProductRating: Navigation.Action {
  var productId: Int
  var rate: ProductRating
  var animated: Bool = true
}

/// Presents product screen and then modally presents product rating screen.
/// If other modal screen is presented, it will be dismissed first.
struct PresentProductRatingNavigator: TypedNavigator {
  @Dependency var tabs: () -> TabsViewControlling?
  @Dependency var navigator: Navigator

  func perform(_ action: PresentProductRating, completion: @escaping () -> Void) {
    guard let tabs = self.tabs() else { return }
    navigator.perform(DismissModal(from: tabs, animated: action.animated)) {
      navigator.perform(PresentProduct(id: action.productId, animated: action.animated)) {
        let viewController = RateProductViewController(
          productId: action.productId,
          rate: action.rate
        )
        navigator.perform(PresentModal(viewController, from: tabs, animated: action.animated)) {
          completion()
        }
      }
    }
  }
}
