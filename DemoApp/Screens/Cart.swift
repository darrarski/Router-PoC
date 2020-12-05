import DI
import Navigation
import UIKit

final class CartViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Cart"
  }

  required init?(coder: NSCoder) { nil }

  @Dependency var navigator: Navigator

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view

    view.addCenteredSubview(UIStackView.vertical(
      ButtonView(title: "Cart product 1") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 1))
      },
      ButtonView(title: "Cart product 2") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 2))
      },
      ButtonView(title: "Cart product 3") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 3))
      },
      ButtonView(title: "Checkout") { [unowned self] in
        self.navigator.perform(PresentCheckout())
      }
    ))
  }
}
