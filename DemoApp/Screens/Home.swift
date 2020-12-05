import DI
import Navigation
import UIKit

final class HomeViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Home"
  }

  required init?(coder: NSCoder) { nil }

  @Dependency var navigator: Navigator

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view

    view.addCenteredSubview(UIStackView.vertical(
      ButtonView(title: "Highlighted product 1") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 1))
      },
      ButtonView(title: "Highlighted product 2") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 2))
      },
      ButtonView(title: "Highlighted product 3") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 3))
      },
      ButtonView(title: "Highlighted category 1") { [unowned self] in
        self.navigator.perform(PresentCategory(id: 1))
      },
      ButtonView(title: "Highlighted category 2") { [unowned self] in
        self.navigator.perform(PresentCategory(id: 2))
      },
      ButtonView(title: "Highlighted category 3") { [unowned self] in
        self.navigator.perform(PresentCategory(id: 3))
      }
    ))
  }
}
