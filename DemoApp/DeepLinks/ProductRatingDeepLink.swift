import Foundation

struct ProductRatingDeepLink: Equatable {
  var id: Int
  var rate: ProductRating
}

extension ProductRatingDeepLink {
  /// Creates product rating deep link from URL. Returns nil if provided URL is invalid.
  /// - Parameter url: url in form of "router-demo://p/{product_id:Int}?rating={product_rating:Int}"
  init?(with url: URL) {
    guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false),
       urlComponents.scheme == "router-demo",
       urlComponents.host == "p",
       let productId = url.pathComponents[safeIndex: 1].map(Int.init(_:)) as? Int,
       let ratingQueryItem = urlComponents.queryItems?.first,
       ratingQueryItem.name == "rating",
       let ratingRawValue = ratingQueryItem.value.map(Int.init(_:)) as? Int,
       let productRating = ProductRating(rawValue: ratingRawValue)
    else { return nil }
    self.id = productId
    self.rate = productRating
  }
}
