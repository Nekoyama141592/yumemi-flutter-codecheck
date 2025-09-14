// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [MyHomePage]
class MyHomeRoute extends PageRouteInfo<void> {
  const MyHomeRoute({List<PageRouteInfo>? children})
    : super(MyHomeRoute.name, initialChildren: children);

  static const String name = 'MyHomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyHomePage();
    },
  );
}

/// generated route for
/// [RepositoryItemPage]
class RepositoryItemRoute extends PageRouteInfo<RepositoryItemRouteArgs> {
  RepositoryItemRoute({
    Key? key,
    String userName = '',
    String name = '',
    List<PageRouteInfo>? children,
  }) : super(
         RepositoryItemRoute.name,
         args: RepositoryItemRouteArgs(
           key: key,
           userName: userName,
           name: name,
         ),
         rawPathParams: {'userName': userName, 'name': name},
         initialChildren: children,
       );

  static const String name = 'RepositoryItemRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<RepositoryItemRouteArgs>(
        orElse: () => RepositoryItemRouteArgs(
          userName: pathParams.getString('userName', ''),
          name: pathParams.getString('name', ''),
        ),
      );
      return RepositoryItemPage(
        key: args.key,
        userName: args.userName,
        name: args.name,
      );
    },
  );
}

class RepositoryItemRouteArgs {
  const RepositoryItemRouteArgs({this.key, this.userName = '', this.name = ''});

  final Key? key;

  final String userName;

  final String name;

  @override
  String toString() {
    return 'RepositoryItemRouteArgs{key: $key, userName: $userName, name: $name}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RepositoryItemRouteArgs) return false;
    return key == other.key && userName == other.userName && name == other.name;
  }

  @override
  int get hashCode => key.hashCode ^ userName.hashCode ^ name.hashCode;
}
