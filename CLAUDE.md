# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is a Flutter application using a clean architecture with flavor-based builds (dev/prod). The codebase follows a layered architecture pattern with clear separation of concerns and uses Riverpod for state management.

## Architecture
The project follows a clean architecture pattern organized in layers:
- `application/` - Application-specific business rules, use cases, theme configuration, app router, and flavor definitions
- `core/` - Cross-cutting concerns (extensions, providers, utilities)
- `domain/` - Enterprise business rules (entities, repository interfaces, value objects)
- `infrastructure/` - External agency interfaces (data sources, repositories, API models)
- `presentation/` - UI layer (components, pages, navigation, notifiers, state)

Key architectural features:
- **State Management**: Uses Riverpod with hooks (`hooks_riverpod`)
- **Code Generation**: Leverages `freezed`, `json_annotation`, and `riverpod_annotation` for boilerplate reduction
- **API Integration**: Uses `retrofit` with `dio` for HTTP client
- **Navigation**: Auto-generated routes with `auto_route`
- **Localization**: Supports English, Japanese, and Chinese with `flutter_localizations`

## Development Commands
**Setup:**
```bash
flutter pub get
```

**Code Generation:**
```bash
# Generate all code (freezed, json_serializable, riverpod, auto_route)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode for development
flutter pub run build_runner watch --delete-conflicting-outputs
```

**Development:**
```bash
# Run with dev flavor
flutter run --flavor dev

# Run with prod flavor
flutter run --flavor prod
```

**Quality Assurance:**
```bash
# Analyze code
flutter analyze

# Format code (required for CI)
dart format --set-exit-if-changed .

# Run tests
flutter test
# Or with expanded output
flutter test -r expanded
```

**Build:**
```bash
# Build APK (prod)
flutter build apk --flavor prod --dart-define=appFlavor=prod

# Build iOS (prod)
flutter build ios --flavor prod --dart-define=appFlavor=prod
```

**Icon Generation:**
```bash
# Dev icons
dart run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml

# Prod icons
dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml
```

## Code Standards
- Uses `flutter_lints` for linting rules
- Files in `lower_snake_case.dart`
- Classes in `UpperCamelCase`
- Members in `lowerCamelCase`
- Use `dart format` with 2-space indentation
- Always run `flutter analyze` before committing
- Generated files (`*.g.dart`, `*.freezed.dart`) are excluded from analysis

## State Management with Riverpod
- Uses `@riverpod` annotation for providers
- Providers are organized in `lib/core/provider/` by category:
  - `keep_alive/` - Providers that persist throughout app lifecycle
  - `auto_dispose/` - Providers that auto-dispose when not used
  - `repository/` - Repository providers
  - `datasource/` - Data source providers
  - `overrides/` - Override providers (like SharedPreferences)

## Testing
- Framework: `flutter_test`
- Test files: `test/` directory mirroring `lib/` structure
- Naming: end test files with `_test.dart`
- Uses `SharedPreferences.setMockInitialValues({})` for mocking SharedPreferences
- Ensure all tests pass with `flutter test`

## Flavors
The app supports two flavors:
- **dev**: Development build (`Flavor.dev`) - "Codecheck Dev"
- **prod**: Production build (`Flavor.prod`) - "Codecheck"

Flavor configuration is handled in `lib/application/flavors.dart` with the `F` class providing static access to flavor properties. Always specify `--dart-define=appFlavor=<flavor>` when running or building.

## Key Dependencies
- **State Management**: `hooks_riverpod`, `flutter_hooks`
- **Code Generation**: `freezed`, `json_annotation`, `riverpod_annotation`
- **HTTP Client**: `retrofit`, `dio`
- **Navigation**: `auto_route`
- **Storage**: `shared_preferences`, `flutter_secure_storage`
- **Flavors**: `flutter_flavor`