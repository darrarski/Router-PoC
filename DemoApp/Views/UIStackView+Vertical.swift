import UIKit

extension UIStackView {
  static func vertical(_ arrangedSubviews: UIView...) -> Self {
    let view = Self.init(arrangedSubviews: arrangedSubviews)
    view.axis = .vertical
    view.spacing = 16
    return view
  }
}
