import DI
import Navigation
import UIKit

final class CategoryViewController: UIViewController {
  init(categoryId: Int) {
    super.init(nibName: nil, bundle: nil)
    title = "Category \(categoryId)"
  }

  required init?(coder: NSCoder) { nil }

  @Dependency var navigator: Navigator

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view

    view.addCenteredSubview(UIStackView.vertical(
      ButtonView(title: "Product 1") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 1))
      },
      ButtonView(title: "Product 2") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 2))
      },
      ButtonView(title: "Product 3") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 3))
      }
    ))
  }
}
