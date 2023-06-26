import 'package:flutter/material.dart';

import '../../features/buying_something/presentation/page/buying_something.dart';
import '../../features/edit_profile/presentation/page/edit_profile_page.dart';
import '../../features/goals_idea/presentation/page/goals_page.dart';
import '../../features/guidance_idea/presentation/page/guidance_page.dart';
import '../../features/home/presentation/page/home_page.dart';
import '../../features/interesting_idea/presentation/page/interesting_idea_page.dart';
import '../../features/new_idea/presentation/page/create_new_idea_page.dart';
import '../../features/routine_task_idea/presentation/page/routine_task_page.dart';
import '../../features/routine_task_idea/presentation/page/sub_notes_add_page.dart';
import '../../features/settings/presentation/page/setting_page.dart';

class Routes {
  static const mainPage = '/';
  static const newIdeaPage = '/createNewIdeaPage';
  static const interestingIdeaPage = '/interestingIdeaPage';
  static const goalsPage = '/goalsPage';
  static const buyingSomethingPage = '/buyingSomethingPage';
  static const routineTaskPage = '/routineTaskPage';
  static const guidancePage = '/guidancePage';
  static const settingsPage = '/settingPage';
  static const subNotesPage = '/subNotesPage';
  static const editProfilePage = '/editProfilePage';

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
        case interestingIdeaPage:
          return MaterialPageRoute(
            builder: (_) => InterestingIdeaPage(
              model: args?['model'],
              updateIndex: args?['index'],
            ),
          );
        case buyingSomethingPage:
          return MaterialPageRoute(
            builder: (_) => const BuyingSomethingPage(),
          );
        case goalsPage:
          return MaterialPageRoute(
            builder: (_) => const GoalsPage(),
          );
        case routineTaskPage:
          return MaterialPageRoute(
            builder: (_) => const RoutineTaskPage(),
          );
        case guidancePage:
          return MaterialPageRoute(
            builder: (_) => const GuidancePage(),
          );
        case settingsPage:
          return MaterialPageRoute(
            builder: (_) => const SettingsPage(),
          );
        case subNotesPage:
          return MaterialPageRoute(
            builder: (_) => const SubNotesAddPage(),
          );
        case editProfilePage:
          return MaterialPageRoute(
            builder: (_) => const EditProfilePage(),
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
