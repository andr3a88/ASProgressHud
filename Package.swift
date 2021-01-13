// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ASProgressHud",
    products: [
        .library(
            name: "ASProgressHud",
            targets: ["ASProgressHud"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ASProgressHud",
            resources: [.process("Assets")],
            dependencies: []),
        .testTarget(
            name: "ASProgressHudTests",
            dependencies: ["ASProgressHud"]),
    ]
)
