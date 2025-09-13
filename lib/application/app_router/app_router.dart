import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/my_home_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this.ref);
  final Ref ref;
  @override
  List<AutoRoute> get routes {
    return [AutoRoute(page: MyHomeRoute.page, path: MyHomePage.path)];
  }
}
