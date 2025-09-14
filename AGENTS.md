# Repository Guidelines (for Agents)

## Project Structure
- Source code is layered under `lib/`:
  - `application/` – router, theme, flavors, app wiring
  - `core/` – providers, utilities, extensions, overrides
  - `domain/` – entities and repository interfaces (no infrastructure imports)
  - `infrastructure/` – API clients, models, repositories (implements domain interfaces)
  - `presentation/` – UI pages, components, notifiers, state
  - `main.dart` – application entry point
- Tests live in `test/` mirroring the `lib/` structure.
- Assets live under `assets/` (icons under `assets/images/`). Flavor/icon configs are in `flutter_launcher_icons-*.yaml`.

## Code Generation
Use build_runner for all codegen (freezed, json_serializable, riverpod, auto_route):
- One‑off: `flutter pub run build_runner build --delete-conflicting-outputs`
- Watch: `flutter pub run build_runner watch --delete-conflicting-outputs`

Localization strings are managed via ARB files in `lib/l10n/`:
- After editing ARB files, run: `flutter gen-l10n`

Never edit generated files (`*.g.dart`, `*.freezed.dart`) by hand.

## Run, Build, Test
- Install deps: `flutter pub get`
- Run (with flavors):
  - Dev: `flutter run --flavor dev --dart-define=appFlavor=dev`
  - Prod: `flutter run --flavor prod --dart-define=appFlavor=prod`
- Build artifacts:
  - APK (prod): `flutter build apk --flavor prod --dart-define=appFlavor=prod`
  - iOS (prod): `flutter build ios --flavor prod --dart-define=appFlavor=prod`
- Analyze: `flutter analyze`
- Format (CI enforced): `dart format --set-exit-if-changed .`
- Test: `flutter test` (or `flutter test -r expanded`)

Launcher icons:
- Dev: `dart run flutter_launcher_icons -f flutter_launcher_icons-dev.yaml`
- Prod: `dart run flutter_launcher_icons -f flutter_launcher_icons-prod.yaml`

## Architecture Rules
- Keep domain pure: domain layer must not import infrastructure.
- Repositories in `infrastructure/repository` implement interfaces from `domain/repository_interface`.
- Map infrastructure models to domain entities via `fromModel` factory constructors.
- State management: use Riverpod with `@riverpod` annotations. Organize providers under `lib/core/provider/` by category:
  - `keep_alive/` – app‑wide singletons
  - `auto_dispose/` – scoped providers
  - `datasource/`, `repository/`, `overrides/` as applicable
- Navigation: use `auto_route` with `@RoutePage()` on pages and keep routes in `application/app_router`.
- Localization: add strings to ARB files (en/ja/zh) and regenerate via `flutter gen-l10n`.

## Coding Standards
- Lints: follow `flutter_lints` (see `analysis_options.yaml`). Keep analyzer warnings at 0.
- Naming: files `lower_snake_case.dart`; classes `UpperCamelCase`; members `lowerCamelCase`.
- Formatting: run `dart format` (2‑space indent, trailing commas on multiline).
- Avoid `print`; prefer proper logging. Prefer immutable widgets where possible.

## Testing
- Use `flutter_test`.
- Place tests under `test/` mirroring `lib/` and name files `*_test.dart`.
- Use available helpers (e.g., `SharedPreferences.setMockInitialValues({})`) when needed.
- Ensure `flutter test` passes locally before proposing changes.

## Security & Configuration
- Never commit secrets. Use `--dart-define` for compile‑time values.
- Verify flavor‑specific IDs/bundle names before release builds.
- Use `flutter_secure_storage` for sensitive on‑device data.

## PR & Commit Etiquette
- Commit messages: `add:`, `fix:`, `change:`, `remove:` + concise summary. Optional scope, e.g. `add(presentation): home banner`.
- Keep diffs focused. Update `ARCHITECTURE.md` if structure changes.
- Include summary, linked issues, and screenshots for UI changes.

## Agent Tips
- Prefer constructor injection for repos/clients and expose Riverpod providers for wiring.
- When adding providers, include the `part '*.g.dart';` and annotate with `@riverpod`.
- After changing providers/entities/models, run codegen and analyzer locally.
- Do not rename/move files unnecessarily; follow existing folder conventions.
