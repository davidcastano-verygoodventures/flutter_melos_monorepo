// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "iOSConsumer",
    platforms: [
        .iOS(.v14)
    ],
    dependencies: [
        // Point to the root Package.swift which defines the binary targets
        .package(name: "FlutterIntegration", path: "../../")
    ],
    targets: [
        .target(
            name: "iOSConsumer",
            dependencies: [
                .product(name: "FlutterIntegration", package: "FlutterIntegration")
            ]
        )
    ]
)
