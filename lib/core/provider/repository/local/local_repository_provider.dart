import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/core/provider/overrides/prefs/prefs_provider.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/repository/local_repository.dart';
part 'local_repository_provider.g.dart';

@riverpod
LocalRepository localRepository(Ref ref) =>
    LocalRepository(ref.watch(prefsProvider));
