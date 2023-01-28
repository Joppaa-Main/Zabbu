import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zabbu/app_theme.dart';
import 'package:zabbu/presentation/pages/home/home_page.dart';
import 'package:zabbu/presentation/routes/routes.dart';
import 'package:zabbu/values/values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;
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
