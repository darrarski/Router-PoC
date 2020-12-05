import UIKit

enum ProductRating: Int, CaseIterable {
  case oneStar = 1
  case twoStars
  case threeStars
  case fourStars
  case fiveStars
}

final class RateProductViewController: UIViewController {
  init(productId: Int, rate: ProductRating) {
    self.productId = productId
    self.rate = rate
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) { nil }

  let productId: Int
  let rate: ProductRating

  override func loadView() {
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.view = view

    let titleLabel = UILabel()
    titleLabel.font = .preferredFont(forTextStyle: .title1)
    titleLabel.text = "Product \(productId)"

    let starsStack = UIStackView()
    starsStack.axis = .horizontal
    starsStack.spacing = 8
    starsStack.distribution = .equalSpacing
    ProductRating.allCases.forEach { rate in
      let fill = rate.rawValue <= self.rate.rawValue
      let image = UIImage(systemName: fill ? "star.fill" : "star")!
      let view = UIImageView(image: image)
      starsStack.addArrangedSubview(view)
    }

    view.addCenteredSubview(UIStackView.vertical(
      titleLabel,
      starsStack
    ))
  }
}
