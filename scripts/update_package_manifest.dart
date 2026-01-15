import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';

// usage: dart scripts/update_package_manifest.dart <version> <repo_url>
// example: dart scripts/update_package_manifest.dart v1.0.0 https://github.com/myuser/myrepo

void main(List<String> args) async {
  if (args.length < 2) {
    print('Usage: dart scripts/update_package_manifest.dart <version> <repo_url>');
    exit(1);
  }

  final version = args[0];
  // Ensure version doesn't have 'v' prefix for the package version, but keeping it for URL might be needed depending on tag
  final versionString = version.startsWith('v') ? version.substring(1) : version;
  final tag = version.startsWith('v') ? version : 'v$version';
  
  final repoUrl = args[1]; // e.g. https://github.com/user/repo (ensure no trailing slash)
  
  // Paths to zips
  final appZipPath = 'build/ios_frameworks/App.xcframework.zip';
  final flutterZipPath = 'build/ios_frameworks/Flutter.xcframework.zip';

  // Calculate Checksums
  final appChecksum = await _calculateSha256(appZipPath);
  final flutterChecksum = await _calculateSha256(flutterZipPath);

  final packageContent = '''
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
            url: "$repoUrl/releases/download/$tag/App.xcframework.zip",
            checksum: "$appChecksum"
        ),
        .binaryTarget(
            name: "Flutter",
            url: "$repoUrl/releases/download/$tag/Flutter.xcframework.zip",
            checksum: "$flutterChecksum"
        )
    ]
)
''';

  final file = File('Package.swift');
  await file.writeAsString(packageContent);
  print('Updated Package.swift for version $version');
  print('App Checksum: $appChecksum');
  print('Flutter Checksum: $flutterChecksum');
}

Future<String> _calculateSha256(String path) async {
  final file = File(path);
  if (!file.existsSync()) {
    print('Error: File not found at $path');
    exit(1);
  }
  final bytes = await file.readAsBytes();
  return sha256.convert(bytes).toString();
}
