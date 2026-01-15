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
  final versionString = version;
  final tag = version;
  
  final repoUrl = args[1]; // e.g. https://github.com/user/repo (ensure no trailing slash)
  
  // Paths to zips
  final appZipPath = 'build/ios_frameworks/App.xcframework.zip';
  final flutterZipPath = 'build/ios_frameworks/Flutter.xcframework.zip';
  final pluginZipPath = 'build/ios_frameworks/FlutterPluginRegistrant.xcframework.zip';

  // Calculate Checksums
  final appChecksum = await _calculateSha256(appZipPath);
  final flutterChecksum = await _calculateSha256(flutterZipPath);
  
  String? pluginChecksum;
  if (File(pluginZipPath).existsSync()) {
    pluginChecksum = await _calculateSha256(pluginZipPath);
  }

  final packageContent = StringBuffer();
  packageContent.writeln('// swift-tools-version:5.3');
  packageContent.writeln('import PackageDescription');
  packageContent.writeln('');
  packageContent.writeln('let package = Package(');
  packageContent.writeln('    name: "flutter_melos_monorepo",');
  packageContent.writeln('    platforms: [');
  packageContent.writeln('        .iOS(.v14)');
  packageContent.writeln('    ],');
  packageContent.writeln('    products: [');
  packageContent.writeln('        .library(');
  packageContent.writeln('            name: "FlutterIntegration",');
  packageContent.writeln('            targets: ["FlutterIntegration"]');
  packageContent.writeln('        ),');
  packageContent.writeln('        .library(');
  packageContent.writeln('            name: "App",');
  packageContent.writeln('            targets: ["App"]');
  packageContent.writeln('        ),');
  packageContent.writeln('        .library(');
  packageContent.writeln('            name: "Flutter",');
  packageContent.writeln('            targets: ["Flutter"]');
  packageContent.writeln('        ),');
  if (pluginChecksum != null) {
    packageContent.writeln('        .library(');
    packageContent.writeln('            name: "FlutterPluginRegistrant",');
    packageContent.writeln('            targets: ["FlutterPluginRegistrant"]');
    packageContent.writeln('        ),');
  }
  packageContent.writeln('    ],');
  packageContent.writeln('    targets: [');
  packageContent.writeln('        .target(');
  packageContent.writeln('            name: "FlutterIntegration",');
  packageContent.writeln('            dependencies: [');
  packageContent.writeln('                .target(name: "App"),');
  packageContent.writeln('                .target(name: "Flutter"),');
  if (pluginChecksum != null) {
    packageContent.writeln('                .target(name: "FlutterPluginRegistrant"),');
  }
  packageContent.writeln('            ]');
  packageContent.writeln('        ),');
  packageContent.writeln('        .binaryTarget(');
  packageContent.writeln('            name: "App",');
  packageContent.writeln('            url: "$repoUrl/releases/download/$tag/App.xcframework.zip",');
  packageContent.writeln('            checksum: "$appChecksum"');
  packageContent.writeln('        ),');
  packageContent.writeln('        .binaryTarget(');
  packageContent.writeln('            name: "Flutter",');
  packageContent.writeln('            url: "$repoUrl/releases/download/$tag/Flutter.xcframework.zip",');
  packageContent.writeln('            checksum: "$flutterChecksum"');
  packageContent.writeln('        ),');
  if (pluginChecksum != null) {
    packageContent.writeln('        .binaryTarget(');
    packageContent.writeln('            name: "FlutterPluginRegistrant",');
    packageContent.writeln('            url: "$repoUrl/releases/download/$tag/FlutterPluginRegistrant.xcframework.zip",');
    packageContent.writeln('            checksum: "$pluginChecksum"');
    packageContent.writeln('        ),');
  }
  packageContent.writeln('    ]');
  packageContent.writeln(')');

  final file = File('Package.swift');
  await file.writeAsString(packageContent.toString());
  print('Updated Package.swift for version $version');
  print('App Checksum: $appChecksum');
  print('Flutter Checksum: $flutterChecksum');
  if (pluginChecksum != null) {
    print('PluginRegistrant Checksum: $pluginChecksum');
  }
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
