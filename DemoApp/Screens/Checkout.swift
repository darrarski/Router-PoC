import UIKit

final class CheckoutViewController: UIViewController {
  init() {
    super.init(nibName: nil, bundle: nil)
    title = "Checkout"
  }

  required init?(coder: NSCoder) { nil }

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view
  }
}
