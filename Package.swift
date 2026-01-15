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
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/vmain/App.xcframework.zip",
            checksum: "b6fda9330a85407395570cb7bff1ab42d2f882ea4eb5fc28dac43f908899b7d0"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/vmain/Flutter.xcframework.zip",
            checksum: "04fc213c20c80719990aba554a50260beb7189bccc7d6b1e56d1f847a2105531"
        )
    ]
)
