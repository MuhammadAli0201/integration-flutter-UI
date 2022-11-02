import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integration_project/core/Routes/appRoutes.dart';
import 'package:slidable_button/slidable_button.dart';

import '../../../core/SharedPreferences/sharedPreferences.dart';
import '../../../core/singleton/singleton.dart';

class SplashController extends GetxController {
  String? welcomeMsg = "Integral Calulator";
  @override
  void onInit() {
    super.onInit();
    splashScreenTimer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onInitThemeSettings();
    });
  }

  void onInitThemeSettings() {
    if (SharedPreferencesClass.GetTheme() == true) {
      Singleton().isDark = SharedPreferencesClass.GetTheme();
      Get.changeThemeMode(ThemeMode.dark);
      Singleton().initialPosition = SlidableButtonPosition.end;
    } else {
      Singleton().isDark = SharedPreferencesClass.GetTheme()!;
      Get.changeThemeMode(ThemeMode.light);
      Singleton().initialPosition = SlidableButtonPosition.start;
    }
  }

  void splashScreenTimer() {
    Timer(Duration(seconds: 2), () => Get.offNamed(Routes.homeScreen));
  }
}
