// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Gimli",
    products: [
        .library(
            name: "Gimli",
            targets: ["Gimli"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Gimli",
            dependencies: []),
        .testTarget(
            name: "GimliTests",
            dependencies: ["Gimli"]),
    ]
)
