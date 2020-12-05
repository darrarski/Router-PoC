// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "DI",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(name: "DI", targets: ["DI"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "DI",
      path: "Sources"
    ),
    .testTarget(
      name: "DITests",
      dependencies: [
        .target(name: "DI"),
      ],
      path: "Tests"
    ),
  ]
)
