import UIKit

final class ContactViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Contact"
  }

  required init?(coder: NSCoder) { nil }

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view
  }
}
