import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/theme/themes.dart';
import 'core/bloc/bloc_scope.dart';
import 'core/routes/routes.dart';
import 'core/services/notifications.dart';
import 'core/singletons/service_locator.dart';
import 'features/interesting_idea/data/models/interesting_idea_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  notificationService = NotificationService();
  await setupLocator();
  await Hive.initFlutter();
  Hive.registerAdapter<InterestingIdeaModel>(InterestingIdeaModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     systemNavigationBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.dark));
    return BlocScope(
      child: MaterialApp(
        title: 'Note App',
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        onGenerateRoute: (setting) => Routes.generateRoutes(setting),
      ),
    );
  }
}
