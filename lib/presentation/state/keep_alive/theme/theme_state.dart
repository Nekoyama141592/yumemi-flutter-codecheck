import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';
part 'theme_state.g.dart';

@freezed
abstract class ThemeState with _$ThemeState {
  const ThemeState._();
  const factory ThemeState({@Default(true) bool isDarkMode}) = _ThemeState;
  factory ThemeState.fromJson(Map<String, dynamic> json) =>
      _$ThemeStateFromJson(json);
}
