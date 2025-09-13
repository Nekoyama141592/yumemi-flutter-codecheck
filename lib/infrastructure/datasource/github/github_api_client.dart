import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/github/search_repositories/request/search_repositories_request.dart';
import '../../model/github/search_repositories/response/search_repositories_response.dart';

part 'github_api_client.g.dart';

@RestApi(baseUrl: 'https://api.github.com')
abstract class GitHubApiClient {
  factory GitHubApiClient(Dio dio, {String baseUrl}) = _GitHubApiClient;

  // クエリパラメータを使用したRetrofitメソッド
  @GET('/search/repositories')
  Future<SearchRepositoriesResponse> _searchRepositories(
    @Query('q') String q,
    @Query('sort') String? sort,
    @Query('order') String? order,
    @Query('per_page') int? perPage,
    @Query('page') int? page,
  );

  // リクエストモデルを使ったラッパーメソッド
  Future<SearchRepositoriesResponse> searchRepositories(
    SearchRepositoriesRequest request,
  ) {
    return _searchRepositories(
      request.q,
      request.sort,
      request.order,
      request.perPage,
      request.page,
    );
  }
}
