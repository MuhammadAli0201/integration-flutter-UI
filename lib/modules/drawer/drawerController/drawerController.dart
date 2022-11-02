import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integration_project/core/SharedPreferences/sharedPreferences.dart';
import 'package:integration_project/core/singleton/singleton.dart';
import 'package:slidable_button/slidable_button.dart';

class HomeDrawerController extends GetxController {
  HomeDrawerController();
  Rx<String>? themeMsg = "Theme".obs;
  @override
  void onInit() {
    super.onInit();
  }

  Future switchThemes(position) async {
    if (position == SlidableButtonPosition.end) {
      Get.changeThemeMode(ThemeMode.dark);
      themeMsg?.value = "Dark Mode";
      Singleton().initialPosition = SlidableButtonPosition.end;
      Singleton().isDark = true;
      await SharedPreferencesClass.SetTheme(Singleton().isDark!);
    } else if (position == SlidableButtonPosition.start) {
      Get.changeThemeMode(ThemeMode.light);
      Singleton().isDark = false;
      themeMsg?.value = "Light Mode";
      Singleton().initialPosition = SlidableButtonPosition.start;
      await SharedPreferencesClass.SetTheme(Singleton().isDark!);
    }
  }
}
