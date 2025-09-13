import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yumemi_flutter_codecheck/domain/entity/search_repositories_item/search_repositories_item_entity.dart';

part 'my_home_state.freezed.dart';
part 'my_home_state.g.dart';

@freezed
abstract class MyHomeState with _$MyHomeState {
  const MyHomeState._();
  const factory MyHomeState({
    required List<SearchRepositoriesItemEntity> repositories,
  }) = _MyHomeState;
  factory MyHomeState.fromJson(Map<String, dynamic> json) =>
      _$MyHomeStateFromJson(json);
}
