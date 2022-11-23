// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TuistTemplateGenerator",
    platforms: [.macOS(.v11)],
    products: [
        .executable(
            name: "tuist-template",
            targets: ["TuistPluginTemplateCommand"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit.git", .exact("2.9.0")),
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMinor(from: "1.0.0")),
    ],
    targets: [
        .executableTarget(
            name: "TuistPluginTemplateCommand",
            dependencies: [
                "TuistPluginTemplate",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "TuistPluginTemplate",
            dependencies: [
                .product(name: "StencilSwiftKit", package: "StencilSwiftKit"),
            ]
        ),
    ]
)
