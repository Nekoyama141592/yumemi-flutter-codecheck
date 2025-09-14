import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RepositoryItemPage extends StatelessWidget {
  const RepositoryItemPage({
    super.key,
    @pathParam this.userName = '',
    @pathParam this.name = '',
  });

  static const path = '/users/:userName/repositories/:name';

  final String userName;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('$userName/$name')));
  }
}
