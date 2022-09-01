import 'package:flutter/material.dart';
import 'package:new_exercise/presentation/routes/routes.dart';

import 'config/theme/themes.dart';

void main() {
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
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      onGenerateRoute: (setting) => Routes.generateRoutes(setting),
    );
  }
}
