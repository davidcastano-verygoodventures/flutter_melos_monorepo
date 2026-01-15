# integration_module

This is the core Flutter module of the monorepo. It serves as the primary entry point for native integration.

## Purpose
- Orchestrates dependencies between `ui_kit` and `core_utils`.
- Compiled into AARs (Android) and XCFrameworks (iOS) during the automated release process.
- Direct consumer of all internal packages.

## Integration
For technical instructions on how to embed this module into your native apps, see the [Integration Guide](../../.gemini/antigravity/brain/eafb390f-2b1f-4fd2-9319-5823405ea1f1/integration_guide.md).
