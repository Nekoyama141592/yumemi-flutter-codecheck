# Claude Code プロンプト集
1. lib/application/themeにlight_theme.dartとdark_theme.dartを作成してください。また、ダークテーマの背景色は#0D1117に、ライトテーマの背景色は#ECDCC9にしてください。
2. lib/presentation/my_home_page.dartのAppBarでlib/presentation/common/original_drawer.dartのOriginalDrawerを使用してください。
3. lib/presentation/notifier/theme/theme_notifier.dartにダークモードとライトモードを切り替えるメソッドを作成してください。
4. lib/presentation/common/original_drawer.dartにCupertinoのSwitchを使ってダークモードとライトモードを切り替えられるようにしてください。
5. lib/presentation/common/original_drawer.dartの文言を日本語と簡体字に対応させてください。
6. lib/presentation/notifier/theme/theme_notifier.dartにて、LocalRepositoryProviderを使用して、build時にダークモードかライトモードかを取得して、toggleTheme()にて非同期で保存してください。
7. lib/presentation/notifier/theme/theme_notifier.dartのbuild()の処理内容を_fetchData()というプライベートメソッドに分離してください。
8. SharedPreferences.setMockInitialValuesを使ってLocalRepositoryのUnitテストを行なって