# Flutter Melos Monorepo

A high-performance Flutter monorepo designed for native app integration (Add-to-App) with a professional-grade automated release pipeline.

## Architecture (The PoC)

```mermaid
graph TD
    subgraph FM [Flutter Monorepo Melos]
        subgraph SP [Shared Foundation]
            K["packages/ui_kit<br/>(Design System)"]
            C["packages/core_utils<br/>(Business Logic)"]
        end

        M["apps/integration_module<br/>(Unified Entry)"]
        
        subgraph BD [Binary Distribution CI/CD]
            iOS["App.xcframework<br/>(iOS Framework)"]
            And["Android AARs<br/>(Maven Repo)"]
        end
        
        SP --> M
        M -- "Automated Release" --> iOS
        M -- "Automated Release" --> And
    end

    subgraph NH [Native Host Apps]
        IH["iOS Consumer<br/>(Swift Package Manager)"]
        AH["Android Consumer<br/>(Gradle / Maven)"]
    end

    iOS -- "Native Import" --> IH
    And -- "Native Import" --> AH

    style M fill:#42A5F5,stroke:#1976D2,color:#fff
    style IH fill:#f5f5f7,stroke:#d2d2d7
    style AH fill:#e8f5e9,stroke:#4caf50
    style SP fill:#fff3e0,stroke:#ff9800,stroke-dasharray: 5 5
    style BD fill:#f1f8ff,stroke:#0366d6,stroke-dasharray: 5 5
```

## Table of Contents
- [Architecture (The PoC)](#architecture-the-poc)
- [Key Features](#key-features)
- [Project Structure](#project-structure)
- [Documentation](#documentation)
- [Examples](#examples)

## Key Features
- **Monorepo Management**: Powered by [Melos](https://melos.invertase.dev/).
- **Automated Versioning**: Semantic versioning based on Conventional Commits.
- **Binary Distribution**: 
  - **iOS**: Published via Swift Package Manager (SPM) with automated XCFramework zipping.
  - **Android**: Published as a Zipped Maven Repository for easy Gradle integration.
- **Plugin Support**: Built-in logic to handle `FlutterPluginRegistrant` automatically.

## Project Structure
- `apps/integration_module`: The unified Flutter module that serves as the entry point for native apps.
- `packages/ui_kit`: **Shared Design System** containing reusable widgets and themes used across all apps.
- `packages/core_utils`: **Shared Business Logic** and utilities, ensuring consistent behavior across different modules.
- `examples/`: Minimal host apps for release verification.

## Documentation
- **[Contributing Guide](CONTRIBUTING.md)**: How to develop, build, and trigger releases.
- **[Android Integration Guide](docs/android_integration.md)**: Detailed guide on Maven-based integration and hosted repository alternatives.

## Examples
- **[iOS Consumer](examples/ios_consumer_app)**: Swift app consuming XCFrameworks.
- **[Android Consumer](examples/android_consumer)**: Android app consuming AARs via Maven.
