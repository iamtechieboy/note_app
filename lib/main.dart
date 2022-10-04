import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/models/interesting_idea_model.dart';
import 'package:note_app/presentation/routes/routes.dart';

import 'config/theme/themes.dart';
import 'core/di/bloc_scope.dart';

// Cubitni qo'ship qoying

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
