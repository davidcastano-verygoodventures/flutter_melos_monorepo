# Android Consumer Example

This example demonstrates how to consume the Flutter module as an AAR dependency in a standard Android application.

## Prerequisites

- Android Studio / Gradle
- Internet connection (to download artifacts)

## How to Run

1.  Open this directory (`examples/android_consumer`) in Android Studio.
2.  Run the app (`Run > Run 'app'`).

## How it Works

The project is configured to use a local Maven repository located at `libs/repo`.

An automated Gradle task (`downloadFlutterArtifacts`) runs before the build to check if this repository exists. If it is missing, it automatically downloads the latest `android_maven_repo.zip` from the [GitHub Releases](https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases) of the monorepo and extracts it to `libs/`.

This ensures you can build and run this consumer app without needing to locally build the Flutter module yourself.

## Manual verification using a specific version

To use a specific version of the artifacts (e.g., from a specific tag or a test release), you can pass the URL as a property:

```bash
./gradlew assembleDebug -PFLUTTER_REPO_URL="https://github.com/davidcastano-verygoodventures/flutter_melos_monorepo/releases/download/v1.0.0/android_maven_repo.zip"
```
