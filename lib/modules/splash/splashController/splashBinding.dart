import 'package:get/get.dart';
import 'package:integration_project/modules/splash/splashController/splashController.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController());
  }
  
}