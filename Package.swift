// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "flutter_melos_monorepo",
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
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/1.1.4/App.xcframework.zip",
            checksum: "302b2c0baa4c31e0b4eddcb27c20c2ccc55f2875d1efaa9ab75f1e2175549c71"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/1.1.4/Flutter.xcframework.zip",
            checksum: "fe7642db29c1bed9b951365a2cc257d4357d500020643f1bd072a4da5ab47c9d"
        )
    ]
)
