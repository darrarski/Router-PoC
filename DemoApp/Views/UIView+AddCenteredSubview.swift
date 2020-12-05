import UIKit

extension UIView {
  func addCenteredSubview(_ subview: UIView) {
    addSubview(subview)
    subview.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      subview.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
      subview.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
    ])
  }
}
