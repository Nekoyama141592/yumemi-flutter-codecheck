# yumemi_flutter_codecheck

このアプリは株式会社ゆめみのFlutterコーディング課題として実装した、GitHubリポジトリ検索用のデモアプリです。課題要件を満たすだけでなく、実務を想定したテストしやすいアーキテクチャとチーム開発を意識したコードベースを整備しています。

## 主な特徴
- GitHub APIを利用したリポジトリ検索と詳細閲覧機能（Retrofit + Dio）
- Riverpod（Hooks対応）による状態管理と依存関係の明示的な注入
- ダーク / ライトテーマ切り替えと、SharedPreferencesを用いた永続化
- Flutter Secure Storageに保存する個人アクセストークン編集ダイアログ
- 日本語・英語・中国語に対応したローカライズ（`lib/l10n/`）
- アニメーションを多用したリッチなUIとアクセシビリティを考慮した操作感

## アーキテクチャ設計のポイント
- **レイヤード構造**：`domain`（純粋なビジネスルール）と`infrastructure`（API・端末機能）を分離し、依存逆転を徹底。
- **テスト容易性**：RiverpodのProvider overrideを活用し、リポジトリやデータソースをモックに差し替えてテスト可能。
- **エンティティとモデルの分離**：APIレスポンスは`infrastructure/model`で定義し、`domain/entity`へマッピングすることでUI層からの切り離しを実現。
- **コード生成の活用**：Freezed / Retrofit / Riverpodのジェネレートコードにより、イミュータブルなデータと型安全なAPIクライアントを提供。
- **ナビゲーション**：AutoRouteで画面遷移を集中管理し、テストやリファクタリング時の影響範囲を限定。

## ディレクトリ構成
```
lib/
  application/   ... ルーター、テーマ、フレーバー設定
  core/          ... 共通プロバイダ・ユーティリティ
  domain/        ... エンティティとリポジトリインターフェース
  infrastructure/... APIクライアント・モデル・リポジトリ実装
  presentation/  ... UI、状態、コンポーネント
  l10n/          ... ローカライズファイル
```
テストコードは`test/`配下に同じ構造で配置し、インフラ層・プロバイダの振る舞いを検証しています。

## セットアップ手順
1. Flutter環境を整備（推奨：最新のStableチャネル）。
2. 依存関係の取得：
   ```sh
   flutter pub get
   ```
3. コード生成（初回および該当ファイル変更時）：
   ```sh
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. ローカライズを更新した場合：
   ```sh
   flutter gen-l10n
   ```

## 実行方法
- 開発フレーバー：
  ```sh
  flutter run --flavor dev
  ```
- 本番フレーバー：
  ```sh
  flutter run --flavor prod --release
  ```
- Android向けビルド（prod）：
  ```sh
  flutter build apk --flavor prod
  ```
- iOS向けビルド（prod）：
  ```sh
  flutter build ios --flavor prod --release
  ```

## GitHubトークンの設定
1. 右上の鍵アイコンをタップしてダイアログを表示。
2. 個人アクセストークン（PAT）を入力して保存すると、`FlutterSecureStorage`に暗号化されて永続化されます。
3. 未入力のまま保存するとトークンは削除され、匿名リクエストとして実行されます。
4. トークン変更後はRiverpodの`Provider`を再構築し、UIに反映されます。

## テストと品質管理
- ユニットテスト：
  ```sh
  flutter test -r expanded
  ```
  - `test/infrastructure/repository/` では、GitHub APIクライアントのモックを用いたマッピング検証や例外ハンドリングを確認。
  - `test/infrastructure/repository/*_provider_test.dart` では、Riverpodのoverrideを利用した依存関係差し替えテストを実装。
- 静的解析：
  ```sh
  flutter analyze
  ```
- フォーマッタ（CI準拠）：
  ```sh
  dart format --set-exit-if-changed .
  ```

## コード生成とメンテナンス
- Provider / Freezed / Retrofitを追加・変更した際は、必ず`build_runner`を再実行してください。
- 生成ファイル（`*.g.dart`, `*.freezed.dart`）は手動で編集しません。
- 多言語対応を拡張する場合は`lib/l10n/*.arb`を編集し、`flutter gen-l10n`を再実行します。

## 開発で意識したこと
- 課題のスコープを越えても保守・拡張しやすい構造を優先し、UI/状態/データアクセスを明確に分離。
- 依存性注入を統一し、テストコードで簡単に差し替えられるようProviderを細かく分割。
- 端末機能（SharedPreferences / SecureStorage）を抽象化し、モックテストで副作用を最小化。
- UIは自作の`AppColors`拡張やアニメーションを用いて、テーマ切り替え時の視認性と体験を向上。

## ライセンス / 注意事項
- 本ソースコードはゆめみのコーディング課題の提出物として作成しています。
- GitHub API利用時はレート制限や利用規約に従ってください。アクセストークンの取り扱いには十分ご注意ください。

上記を参考に、レビューや拡張を行っていただければ幸いです。
