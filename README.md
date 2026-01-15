# Flutter Melos Monorepo

A high-performance Flutter monorepo designed for native app integration (Add-to-App) with a professional-grade automated release pipeline.

## 🚀 Key Features
- **Monorepo Management**: Powered by [Melos](https://melos.invertase.dev/).
- **Automated Versioning**: Semantic versioning based on Conventional Commits.
- **Binary Distribution**: 
  - **iOS**: Published via Swift Package Manager (SPM) with automated XCFramework zipping.
  - **Android**: Published as a Zipped Maven Repository for easy Gradle integration.
- **Plugin Support**: Built-in logic to handle `FlutterPluginRegistrant` automatically.

## 📂 Project Structure
- `apps/integration_module`: The main Flutter module for native entry.
- `packages/ui_kit`: Shared design system and widgets.
- `packages/core_utils`: Shared business logic and utilities.
- `examples/`: Minimal host apps for release verification.

## 📖 Documentation
- **[Contributing Guide](CONTRIBUTING.md)**: How to develop, build, and trigger releases.
- **[Integration Guide](.gemini/antigravity/brain/eafb390f-2b1f-4fd2-9319-5823405ea1f1/integration_guide.md)**: How to connect this monorepo to your native iOS/Android apps.
- **[Release Walkthrough](.gemini/antigravity/brain/eafb390f-2b1f-4fd2-9319-5823405ea1f1/walkthrough.md)**: Technical deep dive into the CI/CD pipeline.
