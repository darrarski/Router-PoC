import DI
import Navigation
import UIKit

final class CategoriesViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Categories"
  }

  required init?(coder: NSCoder) { nil }

  @Dependency var navigator: Navigator

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view

    view.addCenteredSubview(UIStackView.vertical(
      ButtonView(title: "Category 1") { [unowned self] in
        self.navigator.perform(PresentCategory(id: 1))
      },
      ButtonView(title: "Category 2") { [unowned self] in
        self.navigator.perform(PresentCategory(id: 2))
      },
      ButtonView(title: "Category 3") { [unowned self] in
        self.navigator.perform(PresentCategory(id: 3))
      }
    ))
  }
}
