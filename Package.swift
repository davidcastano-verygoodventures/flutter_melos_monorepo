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
            checksum: "f12d965da160592690daf4888bdd3ae6e47d6a0f0fc0775d549b914362d7486b"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/1.1.2/Flutter.xcframework.zip",
            checksum: "67aec76608a1a74addfff8cfed1e6cb6411601b4abe3aebb931bf7e3a9745ef3"
        )
    ]
)
