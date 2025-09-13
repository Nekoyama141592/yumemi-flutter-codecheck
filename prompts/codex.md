# Codex プロンプト集
1. lib/infrastructure/model/github/search_repositories/response 配下に、repository_item、simple_user、license_simple、permission という各フォルダを作成し、それぞれのクラスを分割して管理してください。各クラスのファイルは自動生成されるように設定します。

2. lib/infrastructure/datasource/github/github_api_client.dart では、GitHubApiClient を retrofit および retrofit_generator を用いて実装します。/search/repositories エンドポイントをクエリパラメータ形式でリクエストする際には、lib/infrastructure/model/github/search_repositories/request/search_repositories_request.dart と lib/infrastructure/model/github/search_repositories/response/search_repositories_response.dart を利用してください。

3. lib/infrastructure/model/github/search_repositories/requestのフォルダを削除して、それを踏まえてlib/infrastructure/datasource/github/github_api_client.dartも修正してください。