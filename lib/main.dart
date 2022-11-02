import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:integration_project/core/Routes/appRoutes.dart';
import 'package:integration_project/core/theme/theme.dart';
import 'core/SharedPreferences/sharedPreferences.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
   await SharedPreferencesClass.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.splashScreen,
    getPages: AllRoutes.allRoutes,
    theme: lightThemeData,
    darkTheme: darkThemeData,
    themeMode: ThemeMode.light ,
  ));
}