import UIKit

final class SettingsViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Settings"
  }

  required init?(coder: NSCoder) { nil }

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view
  }
}
