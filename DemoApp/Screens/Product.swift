import DI
import Navigation
import UIKit

final class ProductViewController: UIViewController {
  init(productId: Int) {
    self.productId = productId
    super.init(nibName: nil, bundle: nil)
    title = "Product \(productId)"
  }

  required init?(coder: NSCoder) { nil }

  @Dependency var navigator: Navigator
  let productId: Int

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view

    view.addCenteredSubview(UIStackView.vertical(
      ButtonView(title: "Shopping Cart") { [unowned self] in
        self.navigator.perform(PresentCart())
      },
      ButtonView(title: "Rate the product") { [unowned self] in
        self.navigator.perform(PresentProductRating(productId: self.productId, rate: .fourStars))
      },
      ButtonView(title: "Recommended product 1") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 1))
      },
      ButtonView(title: "Recommended product 2") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 2))
      },
      ButtonView(title: "Recommended product 3") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 3))
      },
      ButtonView(title: "Help") { [unowned self] in
        self.navigator.perform(PresentHelp())
      }
    ))
  }
}
