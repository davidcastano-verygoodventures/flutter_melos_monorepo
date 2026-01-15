# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 1.1.6 (2026-01-15)

### Major Improvements
- **SPM Plugin Support**: Added automated generation and zipping of `FlutterPluginRegistrant.xcframework`.
- **Manifest Synchronization**: Improved release workflow to push `Package.swift` updates directly to `main` with rebase safety.
- **Flexible Tagging**: Full support for both `vX.Y.Z` and `X.Y.Z` semantic version tags.

### Bug Fixes
- **Checksum Resolution**: Fixed a race condition where SPM manifests were outdated relative to build artifacts.
- **CI Reliability**: Added `git pull --rebase` to release workflows to prevent push failures during concurrent changes.

## 1.1.0 (2026-01-15)

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`core_utils` - `v1.1.0`](#core_utils---v110)
 - [`integration_module` - `v1.1.0`](#integration_module---v110)
 - [`ui_kit` - `v0.0.2`](#ui_kit---v002)

---

#### `core_utils` - `v1.1.0`

 - **FEAT**: Initial commit with Melos monorepo and CI/CD pipelines.

#### `integration_module` - `v1.1.0`

 - **FEAT**: Initial commit with Melos monorepo and CI/CD pipelines.

#### `ui_kit` - `v0.0.2`

 - **FEAT**: Initial commit with Melos monorepo and CI/CD pipelines.

