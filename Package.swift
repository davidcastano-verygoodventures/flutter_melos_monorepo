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
            url: "https://github.com/myuser/myrepo/releases/download/v1.0.0/App.xcframework.zip",
            checksum: "c3956bf81a3f0da62a4cc56a66ae8aebaddfdfbef030b3807ae3d9c0bc56566d"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "https://github.com/myuser/myrepo/releases/download/v1.0.0/Flutter.xcframework.zip",
            checksum: "ca83a2ccf2fc7f309cd9b08fec9ab0bb959ca0b30134fbac33b6010ff29862a8"
        )
    ]
)
