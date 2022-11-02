import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integration_project/core/constants/SizedBox.dart';
import 'package:integration_project/core/singleton/singleton.dart';
import 'package:integration_project/core/widgets/reusableText.dart';

import '../splashController/splashController.dart';

class splashScreen extends GetView<SplashController> {
   splashScreen({super.key});
  // var controler=Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Singleton().isDark==true?Colors.black:Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            invertColors: Singleton().isDark==true?true:false,
            image: AssetImage(
            "images/spashImage.jpg",
            )),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ReusableText(text: controller.welcomeMsg,fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor,fontSize: 40,),
            largeSizedBox
          ],
        ),
      ),
    );
  }
}