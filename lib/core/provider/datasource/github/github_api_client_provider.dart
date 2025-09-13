import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yumemi_flutter_codecheck/infrastructure/datasource/github/github_api_client.dart';

part 'github_api_client_provider.g.dart';

@riverpod
GitHubApiClient githubApiClient(Ref ref, {String? token}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com',
      headers: <String, Object?>{
        'Accept': 'application/vnd.github+json',
        'X-GitHub-Api-Version': '2022-11-28',
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      },
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
    ),
  );

  return GitHubApiClient(dio);
}
