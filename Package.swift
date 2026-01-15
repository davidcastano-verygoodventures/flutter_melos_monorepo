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
            checksum: "1b568d67a20f83597cc3f8ba639621c6e694986cc0a5d1c0c66442bf8c1edc1c"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/vmain/Flutter.xcframework.zip",
            checksum: "181003d705d34743d2c16a33a99d6abc611316b776a1aa36dfd4070966c0b95b"
        )
    ]
)
