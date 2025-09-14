import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:yumemi_flutter_codecheck/presentation/page/repository_item/repository_item_page.dart';

class RouteUtil {
  static void _pushPath(BuildContext context, String path) {
    context.router.pushPath(path);
  }

  static void back(BuildContext context) {
    context.router.back();
  }

  static void pushRepositoryItemPage(
    BuildContext context, {
    required String userName,
    required String name,
  }) {
    _pushPath(
      context,
      RepositoryItemPage.generatePath(userName: userName, name: name),
    );
  }
}
