// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LHDSComponents",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LHDSComponents",
            targets: ["LHDSComponents"]),
    ],
    dependencies: [        
        .package(url: "https://github.com/luizhammeli/LHHelpers", from: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-snapshot-testing", from: "1.13.0")
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LHDSComponents",
            dependencies: ["LHHelpers"]),
        .testTarget(
            name: "LHDSComponentsTests",
            dependencies: ["LHDSComponents", .product(name: "SnapshotTesting", package: "swift-snapshot-testing")]),
    ]
)
