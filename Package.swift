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
            checksum: "efeeb559b80f885cff98b00a2ffcadf8173c0ccde22c7220fee2754c2c3d18a5"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/vcore_utils-v1.1.0/Flutter.xcframework.zip",
            checksum: "8a355828159abbac11a1a363ba45b8da39f1751bbdcf7e94053dfdea59065301"
        )
    ]
)
