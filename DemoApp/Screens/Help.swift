import UIKit

final class HelpViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Help"
  }

  required init?(coder: NSCoder) { nil }

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view
  }
}
