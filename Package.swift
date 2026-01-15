// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "FlutterIntegration",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "FlutterIntegration",
            targets: ["FlutterIntegration"]
        ),
        .library(
            name: "App",
            targets: ["App"]
        ),
        .library(
            name: "Flutter",
            targets: ["Flutter"]
        ),
    ],
    targets: [
        .target(
            name: "FlutterIntegration",
            dependencies: [
                .target(name: "App"),
                .target(name: "Flutter")
            ]
        ),
        .binaryTarget(
            name: "App",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/1.1.2/App.xcframework.zip",
            checksum: "6622ec7db323c0da93de197008bcceab8393d26d085924e2cc2cc8c5d3eb494e"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/1.1.2/Flutter.xcframework.zip",
            checksum: "18b9579473a742f0f5bf1b39ba65865bdb6cca1efc69ec15fcfe84c9d20de2d1"
        )
    ]
)
