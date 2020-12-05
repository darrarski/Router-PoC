import UIKit

final class ButtonView: UIButton {
  init(title: String, action: @escaping () -> Void) {
    self.action = action
    super.init(frame: .zero)
    setTitle(title, for: .normal)
    setTitleColor(tintColor, for: .normal)
    addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
  }

  required init?(coder: NSCoder) { nil }

  let action: () -> Void

  @objc func didTouchUpInside() {
    action()
  }
}
