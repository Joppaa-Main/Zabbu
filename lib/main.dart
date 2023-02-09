import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zabbu/app_theme.dart';
import 'package:zabbu/presentation/pages/home/home_page.dart';
import 'package:zabbu/presentation/routes/routes.dart';
import 'package:zabbu/values/values.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:zabbu/firebase_options.dart'  ;

import 'injection_container.dart';

void main() async {
  FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform  ,
    );
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
    setupLocator();
  runApp(MyApp());
}
   //save
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConst.APP_TITLE,
      theme: AppTheme.lightThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.homePageRoute,
      onGenerateRoute: RouteConfiguration.onGenerateRoute,
    );
  }
}
