import DI
import Navigation
import UIKit

final class ObservedViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Observed"
  }

  required init?(coder: NSCoder) { nil }

  @Dependency var navigator: Navigator

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view

    view.addCenteredSubview(UIStackView.vertical(
      ButtonView(title: "Observed product 1") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 1))
      },
      ButtonView(title: "Observed product 2") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 2))
      },
      ButtonView(title: "Observed product 3") { [unowned self] in
        self.navigator.perform(PresentProduct(id: 3))
      }
    ))
  }
}
