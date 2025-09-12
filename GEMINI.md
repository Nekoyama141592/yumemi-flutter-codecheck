# Gemini Code Check

## Project Overview

This is a Flutter project that serves as a starting point for a mobile application. It's structured with a clean architecture, separating concerns into `application`, `core`, `domain`, `infrastructure`, and `presentation` layers. The project is configured with build flavors for `dev` and `prod` environments, allowing for different configurations for development and production builds.

## Building and Running

To build and run the application, use the following commands:

**Run the `dev` flavor:**

```bash
flutter run --flavor dev --target lib/main.dart
```

**Run the `prod` flavor:**

```bash
flutter run --flavor prod --target lib/main.dart
```

**Build the `dev` flavor:**

```bash
flutter build apk --flavor dev --target lib/main.dart
flutter build ios --flavor dev --target lib/main.dart
```

**Build the `prod` flavor:**

```bash
flutter build apk --flavor prod --target lib/main.dart
flutter build ios --flavor prod --target lib/main.dart
```

## Development Conventions

*   **Clean Architecture:** The project follows a clean architecture pattern, with code organized into the following directories:
    *   `lib/application`: Contains application-specific business rules and use cases.
    *   `lib/core`: Contains core functionalities and utilities shared across the application.
    *   `lib/domain`: Contains the domain models and business logic of the application.
    *   `lib/infrastructure`: Contains the implementation of services defined in the domain layer, such as repositories and APIs.
    *   `lib/presentation`: Contains the UI and presentation logic of the application.
*   **Build Flavors:** The project uses `flutter_flavor` to manage different build configurations for `dev` and `prod` environments. Flavor-specific configurations can be found in `pubspec.yaml` and the `android` and `ios` directories.
*   **Linting:** The project uses `flutter_lints` to enforce code quality and style. The linting rules are defined in `analysis_options.yaml`.
