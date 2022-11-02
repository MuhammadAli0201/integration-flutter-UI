import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integration_project/core/constants/SizedBox.dart';
import 'package:integration_project/modules/drawer/drawerController/drawerController.dart';
import 'package:slidable_button/slidable_button.dart';
import '../../../core/singleton/singleton.dart';
import '../../../core/widgets/reusableText.dart';

Widget? drawer(BuildContext context) {
  var controller = Get.put(HomeDrawerController());
  return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      mediumSizedBox,
      ReusableText(text: "Integral Calulator",fontWeight: FontWeight.bold,fontSize: 25,color: Theme.of(context).primaryColor,),
      smallSizedBox,
      Divider(
        thickness: .6,
        color: Theme.of(context).primaryColor,
      ),
      largeSizedBox,
      ListTile(
        leading: ReusableText(
          text: "Theme",
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Theme.of(context).primaryColor,
        ),
        title: HorizontalSlidableButton(
          initialPosition: Singleton().initialPosition,
          width: MediaQuery.of(context).size.width / 3,
          buttonWidth: 85.0,
          color: Colors.lightGreen,
          buttonColor: Theme.of(context).primaryColor,
          dismissible: false,
          label: Center(
              child: Obx(() => ReusableText(
                fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  text: controller.themeMsg?.value.toString()))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableText(text: 'Light Mode',fontWeight: FontWeight.bold,),
                ReusableText(text: 'Dark Mode',fontWeight: FontWeight.bold,),
              ],
            ),
          ),
          onChanged: (position)async {
            await controller.switchThemes(position);
          },
        ),
      )
    ],
  ));
}
