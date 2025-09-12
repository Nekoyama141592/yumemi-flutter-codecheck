# Repository Guidelines

## Project Structure & Module Organization
- Source: `lib/` organized by layers (see `ARCHITECTURE.md`). Typical layout:
  - `application/`, `core/`, `domain/`, `infrastructure/`, `presentation/`, `main.dart`.
- Tests: `test/` mirroring `lib/` (e.g., `test/presentation/...`).
- Assets: `assets/` (icons under `assets/images/`). Flavor and icon configs live in `flutter_launcher_icons-*.yaml`.

## Build, Test, and Development Commands
- Install deps: `flutter pub get`.
- Analyze: `flutter analyze`.
- Format (CI enforces): `dart format --set-exit-if-changed .`.
- Test: `flutter test` (optionally `-r expanded`).
- Run (Android/iOS with flavors):
  - Dev: `flutter run --flavor dev --dart-define=appFlavor=dev`
  - Prod: `flutter run --flavor prod --dart-define=appFlavor=prod`
- Build artifacts:
  - APK: `flutter build apk --flavor prod --dart-define=appFlavor=prod`
  - iOS: `flutter build ios --flavor prod --dart-define=appFlavor=prod`
- Generate launcher icons:
  - Dev: `dart run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml`
  - Prod: `dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml`

## Coding Style & Naming Conventions
- Lints: `flutter_lints` via `analysis_options.yaml`; keep code analyzer-clean.
- Formatting: Use `dart format` (2-space indent, trailing commas for multi-line).
- Naming: files in `lower_snake_case.dart`; classes `UpperCamelCase`; members `lowerCamelCase`.
- Avoid `print`; prefer proper logging and immutable widgets where possible.

## Testing Guidelines
- Framework: `flutter_test`.
- Location: place tests under `test/` mirroring `lib/`.
- Naming: end files with `_test.dart` (e.g., `my_home_page_test.dart`).
- Run locally and ensure CI (`.github/workflows/ci.yml`) passes.

## Commit & Pull Request Guidelines
- Commit style matches history: short, imperative prefixes like `add:`, `fix:`, `change:`, `remove:` plus a concise summary.
- Scope (optional) after the type: `add(presentation): home banner`.
- PRs: include summary, linked issues, screenshots for UI changes, and clear test notes. Keep diffs focused; update `ARCHITECTURE.md` if structure changes.

## Security & Configuration Tips
- Use `--dart-define` for compile-time values; do not commit secrets.
- Verify flavor-specific IDs and bundle names before release builds.
