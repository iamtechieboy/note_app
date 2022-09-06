import 'package:flutter/material.dart';
import 'package:note_app/presentation/pages/main_page.dart';

class Routes {
  static const mainPage = '/';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    try {
      final Map<String, dynamic>? args =
          settings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (settings.name) {
        case mainPage:
          return MaterialPageRoute(
            builder: (_) => const MainPage(),
          );

        default:
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => const MainPage(),
          );
      }
    } catch (e) {
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const MainPage(),
      );
    }
  }
}
