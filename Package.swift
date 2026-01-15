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
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/vcore_utils-v1.1.0/App.xcframework.zip",
            checksum: "2ba2b5b02d2f81b838ffd927f91f90913d1557fa6f3b4563a2b68f2fc53cb144"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/vcore_utils-v1.1.0/Flutter.xcframework.zip",
            checksum: "6af6e24cd1fdd7e41923d4f6cbf47e14046cc7bad313f663a72053479869d39d"
        )
    ]
)
