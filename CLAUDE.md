# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is a Flutter application using a clean architecture with flavor-based builds (dev/prod). The codebase follows a layered architecture pattern with clear separation of concerns.

## Architecture
The project follows a clean architecture pattern organized in layers:
- `application/` - Application-specific business rules and use cases
- `core/` - Cross-cutting concerns (extensions, providers, utilities)
- `domain/` - Enterprise business rules (entities, repositories, value objects)
- `infrastructure/` - External agency interfaces (data sources, repositories)
- `presentation/` - UI layer (components, pages, navigation, notifiers, state)

See `ARCHITECTURE.md` for the complete folder structure.

## Development Commands
**Setup:**
```bash
flutter pub get
```

**Development:**
```bash
# Run with dev flavor
flutter run --flavor dev --dart-define=appFlavor=dev

# Run with prod flavor
flutter run --flavor prod --dart-define=appFlavor=prod
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

## Testing
- Framework: `flutter_test`
- Test files: `test/` directory mirroring `lib/` structure
- Naming: end test files with `_test.dart`
- Ensure all tests pass with `flutter test`

## Flavors
The app supports two flavors:
- **dev**: Development build (`Flavor.dev`)
- **prod**: Production build (`Flavor.prod`)

Always specify `--dart-define=appFlavor=<flavor>` when running or building.