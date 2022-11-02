import 'package:get/get.dart';
import 'package:integration_project/modules/home/homeView/homeScreen.dart';
import 'package:integration_project/modules/splash/splashView/splashScreen.dart';

import '../../modules/home/homeController/homeBinding.dart';
import '../../modules/splash/splashController/splashBinding.dart';

class Routes
{
  static String homeScreen="/HomeScreen";
  static String splashScreen="/splashScreen";
}

class AllRoutes
{
  static List<GetPage> allRoutes=<GetPage>[
    GetPage(name: Routes.homeScreen, page: ()=>HomeScreen(),binding: HomeBinding()),
    GetPage(name: Routes.splashScreen, page: ()=>splashScreen(),binding: SplashBinding())
  ];
}