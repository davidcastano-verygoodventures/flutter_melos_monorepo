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
            checksum: "e9a5a596f771857ddd8765f3376692aabaa012b5588e5c564299a27eb519c02f"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/vmain/Flutter.xcframework.zip",
            checksum: "2d9847d8b772a916f2f16ce0f353e49b283767ffb1ed55fb948b695461282562"
        )
    ]
)
