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
        .library(
            name: "FlutterPluginRegistrant",
            targets: ["FlutterPluginRegistrant"]
        ),
    ],
    targets: [
        .target(
            name: "FlutterIntegration",
            dependencies: [
                .target(name: "App"),
                .target(name: "Flutter"),
                .target(name: "FlutterPluginRegistrant"),
            ]
        ),
        .binaryTarget(
            name: "App",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/1.1.6/App.xcframework.zip",
            checksum: "14f954afb9f8d05aa2a07a423542751da39179fd173f0c189274f1a858acc6e2"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/1.1.6/Flutter.xcframework.zip",
            checksum: "71d33deb44d817545b2629dad460dbfda06b2043d44df40c9c36ebe9abd175a2"
        ),
        .binaryTarget(
            name: "FlutterPluginRegistrant",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/1.1.6/FlutterPluginRegistrant.xcframework.zip",
            checksum: "c0603dcd624b09ff8b0103a74eb8d79ded95c837fb4ea0f7be469d7b0299d33d"
        ),
    ]
)
