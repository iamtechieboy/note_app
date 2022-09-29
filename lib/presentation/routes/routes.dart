import 'package:flutter/material.dart';
import 'package:note_app/presentation/pages/add_sub_notes/sub_notes_list.dart';
import 'package:note_app/presentation/pages/buying_something/buying_something.dart';
import 'package:note_app/presentation/pages/goals_idea/goals_page.dart';
import 'package:note_app/presentation/pages/guidance_idea/guidance_page.dart';
import 'package:note_app/presentation/pages/home/home_page.dart';
import 'package:note_app/presentation/pages/interesting_idea/add_interesting_idea_page.dart';
import 'package:note_app/presentation/pages/new_idea/create_new_idea_page.dart';

class Routes {
  static const mainPage = '/';
  static const newIdeaPage = '/createNewIdeaPage';
  static const interestingIdeaPage = '/interestingIdeaPage';
  static const goalsPage = '/goalsPage';
  static const buyingSomething = '/buyingSomething';
  static const guidancePage = '/guidancePage';
  static const subNotesPage = '/subNotesPage';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    try {
      final Map<String, dynamic>? args = settings.arguments as Map<String, dynamic>?;
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
        case interestingIdeaPage:
          return MaterialPageRoute(
            builder: (_) => const AddInterestingIdeaPage(),
          );
        case goalsPage:
          return MaterialPageRoute(
            builder: (_) => const GoalsPage(),
          );
        case buyingSomething:
          return MaterialPageRoute(
            builder: (_) => const BuyingSomethingPage(),
          );
        case guidancePage:
          return MaterialPageRoute(
            builder: (_) => const GuidancePage(),
          );
        case subNotesPage:
          return MaterialPageRoute(
            builder: (_) => const SubNotesList(),
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
