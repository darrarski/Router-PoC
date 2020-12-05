import DI
import Navigation
import UIKit

final class ProfileViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Profile"
  }

  required init?(coder: NSCoder) { nil }

  @Dependency var navigator: Navigator

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view

    view.addCenteredSubview(UIStackView.vertical(
      ButtonView(title: "Help") { [unowned self] in
        self.navigator.perform(PresentHelp())
      },
      ButtonView(title: "Contact") { [unowned self] in
        self.navigator.perform(PresentContact())
      },
      ButtonView(title: "Settings") { [unowned self] in
        self.navigator.perform(PresentSettings())
      }
    ))
  }
}
