import 'package:flutter/material.dart';
import 'package:todolist_flutter/feature/item/item_screen.dart';
import 'package:todolist_flutter/feature/list/list_screen.dart';

class AppRouter {
  static const String listScreen = '/';
  static const String itemScreen = '/item';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case listScreen:
        return _buildRoute((context) => const ListScreen(), settings);
      case itemScreen:
        return _buildRoute((context) => const ItemScreen(), settings);
      default:
        throw Exception('Unknown route: ${settings.name}');
    }
  }
}

MaterialPageRoute _buildRoute(WidgetBuilder builder, RouteSettings settings) =>
    MaterialPageRoute(builder: builder, settings: settings);
