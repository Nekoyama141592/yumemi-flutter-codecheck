# Gemini Agent Guidelines

## Project Overview
This is a Flutter application built with a clean architecture and build flavors (`dev`/`prod`). It uses Riverpod for state management, AutoRoute for navigation, and extensive code generation to reduce boilerplate.

## Project Structure
- **`lib/`**: Main source code directory.
  - `application/`: App router, theme, flavors, and top-level wiring.
  - `core/`: Shared utilities, providers, and extensions.
  - `domain/`: Business logic, entities, and repository interfaces. This layer must NOT import the infrastructure layer.
  - `infrastructure/`: Data sources, API clients, and repository implementations.
  - `presentation/`: UI widgets, pages, notifiers, and state.
  - `main.dart`: The application entry point.
- **`test/`**: Contains tests, mirroring the `lib/` directory structure.
- **`assets/`**: Static assets, with launcher icons in `assets/images/`.

## Development Commands

**1. Initial Setup:**
Install all dependencies.
```bash
flutter pub get
```

**2. Code Generation:**
The project uses `build_runner` for `freezed`, `json_serializable`, `riverpod`, and `auto_route`.
```bash
# Run a one-off build
flutter pub run build_runner build --delete-conflicting-outputs

# Watch for changes and rebuild automatically
flutter pub run build_runner watch --delete-conflicting-outputs
```
Localization files are generated separately. After editing files in `lib/l10n/`, run:
```bash
flutter gen-l10n
```
*Note: Never edit generated files (`*.g.dart`, `*.freezed.dart`) manually.*

**3. Running the App (with Flavors):**
Always specify both the flavor and the `appFlavor` dart-define variable.
```bash
# Run the 'dev' flavor
flutter run --flavor dev --dart-define=appFlavor=dev

# Run the 'prod' flavor
flutter run --flavor prod --dart-define=appFlavor=prod
```

**4. Building the App:**
```bash
# Build a production APK
flutter build apk --flavor prod --dart-define=appFlavor=prod

# Build a production iOS app
flutter build ios --flavor prod --dart-define=appFlavor=prod
```

**5. Code Quality & Testing:**
CI enforces formatting and analysis checks.
```bash
# Run the code analyzer
flutter analyze

# Format all code
dart format --set-exit-if-changed .

# Run all tests
flutter test
```

**6. Launcher Icons:**
Generate flavor-specific launcher icons using the corresponding configuration file.
```bash
# Generate 'dev' icons
dart run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml

# Generate 'prod' icons
dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml
```

## Key Architectural Rules
- **State Management**: Use Riverpod with the `@riverpod` annotation for providers. Organize providers in `lib/core/provider/`.
- **Navigation**: Use `auto_route`. Annotate page widgets with `@RoutePage()` and define routes in `lib/application/app_router/`.
- **Immutability**: Use `freezed` for data classes (entities, models, state).
- **Repository Pattern**: `infrastructure/repository/` classes must implement interfaces defined in `domain/repository_interface/`.
- **Data Mapping**: Map infrastructure models to domain entities.
- **Testing**: Write tests in the `test/` directory, mirroring the `lib/` structure. Use `flutter_test` and name files `*_test.dart`.

## Agent Instructions
- After modifying any files that require code generation (models, providers, routes), always run the `build_runner` command.
- Always run `flutter analyze` and `flutter test` to verify changes before finalizing your work.
- Adhere strictly to the existing file structure and naming conventions (`lower_snake_case.dart` for files, `UpperCamelCase` for classes).