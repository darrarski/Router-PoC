// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Navigation",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(name: "Navigation", targets: ["Navigation"]),
  ],
  targets: [
    .target(
      name: "Navigation",
      path: "Sources"
    ),
    .testTarget(
      name: "NavigationTests",
      dependencies: [
        .target(name: "Navigation"),
      ],
      path: "Tests"
    ),
  ]
)
