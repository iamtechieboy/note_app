import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/presentation/pages/add_sub_notes/sub_notes_list.dart';
import 'package:note_app/presentation/pages/buying_something/buying_something.dart';
import 'package:note_app/presentation/pages/guidance_idea/guidance_page.dart';
import 'package:note_app/presentation/routes/routes.dart';

import 'config/theme/themes.dart';
import 'core/di/bloc_scope.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    // return BlocScope(
    //   child: MaterialApp(
    //     title: 'Note App',
    //     debugShowCheckedModeBanner: false,
    //     theme: Themes.lightTheme,
    //     onGenerateRoute: (setting) => Routes.generateRoutes(setting),
    //   ),
    // );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SubNotesList(),
    );
  }
}
