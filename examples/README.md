# Release Verification Apps

These minimal "Host Apps" allow you to verify that the released artifacts (XCFrameworks and AARs) are working correctly.

## 1. iOS Consumer
A minimal Swift package that consumes the released XCFrameworks via Swift Package Manager.

### Setup & Verify
1.  Navigate to `examples/ios_consumer`.
2.  Open `Package.swift`.
3.  SPM will automatically resolve dependencies from the root `Package.swift`.
    *   *Note*: The root `Package.swift` points to the **latest release** URL defined in it.
4.  Run the minimal test:
    ```bash
    swift run
    ```
    If successful, it will print: `Successfully imported FlutterIntegration!`

---

## 2. Android Consumer
A minimal Android project that consumes the released AARs via a local Maven repository.

### Setup & Verify
1.  Navigate to `examples/android_consumer`.
2.  **Download Artifacts**:
    You must first download the artifacts from GitHub Releases using the helper script. Replace `v1.1.0` with the tag you want to test.
    ```bash
    ./setup.sh v1.1.0
    ```
    *This script uses `gh release download` to fetch `android_maven_repo.zip` and unzips it into `libs/repo`.*

3.  **Build**:
    ```bash
    ./gradlew build
    ```
    If the build succeeds, the AAR integration is working.
