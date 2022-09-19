import 'package:flutter/material.dart';
import 'package:note_app/presentation/pages/home/home_page.dart';
import 'package:note_app/presentation/pages/new_idea/create_new_idea_page.dart';

class Routes {
  static const mainPage = '/';
  static const newIdeaPage = '/newIdea';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    try {
      final Map<String, dynamic>? args =
          settings.arguments as Map<String, dynamic>?;
      args ?? <String, dynamic>{};
      switch (settings.name) {
        case mainPage:
          return MaterialPageRoute(
            builder: (_) => const HomePage(),
          );
        case newIdeaPage:
          return MaterialPageRoute(
            builder: (_) => const CreateNewIdeasPage(),
          );
        default:
          return MaterialPageRoute(
            settings: settings,
            builder: (_) => const HomePage(),
          );
      }
    } catch (e) {
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const HomePage(),
      );
    }
  }
}
