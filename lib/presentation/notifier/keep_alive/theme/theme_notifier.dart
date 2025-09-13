import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/presentation/state/theme/theme_state.dart';
import 'package:yumemi_flutter_codecheck/core/provider/repository/local/local_repository_provider.dart';
part 'theme_notifier.g.dart';

@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  ThemeState build() {
    return _fetchData();
  }

  ThemeState _fetchData() {
    final localRepository = ref.watch(localRepositoryProvider);
    final isDarkMode = localRepository.getIsDarkMode();
    return ThemeState(isDarkMode: isDarkMode);
  }

  Future<void> toggleTheme() async {
    final localRepository = ref.read(localRepositoryProvider);
    final newIsDarkMode = !state.isDarkMode;
    state = state.copyWith(isDarkMode: newIsDarkMode);
    await localRepository.saveIsDarkMode(newIsDarkMode);
  }
}
