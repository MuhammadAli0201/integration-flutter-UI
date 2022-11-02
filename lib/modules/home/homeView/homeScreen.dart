import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:integration_project/core/widgets/reusableDropDownMenu.dart';
import 'package:integration_project/core/widgets/reusableElevatedButton.dart';
import 'package:integration_project/core/widgets/reusableKeyBoardTextButton.dart';
import 'package:integration_project/modules/drawer/drawerView/drawer.dart';
import '../../../core/singleton/singleton.dart';
import '../../../core/widgets/reusableText.dart';
import '../../../core/widgets/reusableTextFormField.dart';
import '../homeController/homeController.dart';

class HomeScreen extends GetView<homeController> {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:drawer(context),         
        appBar: AppBar(
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: ReusableText(
            text: "Integral Calculator",
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              //============================Enter Values Container============================
              Container(
                height: 170,
                decoration: BoxDecoration(
                    color: Singleton().isDark == true
                        ? Theme.of(context).cardColor
                        : Color.fromARGB(255, 87, 202, 255),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Obx(() => ReusableDropDownMenu(
                                items: controller.respectToItems,
                                value: controller.respectTo.value,
                                heading: "Respect to",
                                onChange: (String? val) {
                                  controller.respectTo.value = val!;
                                },
                              )),
                        ),
                        Expanded(
                            child: ReusableTextFormFeild(
                          onTap: () {
                            controller.controllerHandler?.value =
                                controller.uperLimitController.value;
                          },
                          
                          controller: controller.uperLimitController.value,
                          headingText: "Uper Limit",
                        )),
                        Expanded(
                            child: 
                            ReusableTextFormFeild(
                          onTap: () {
                            controller.controllerHandler?.value =
                                controller.lowerLimitController.value;
                          },
                          controller: controller.lowerLimitController.value,
                          headingText: "Lower Limit",
                        )
                        ),
                      ],
                    ),
                    ReusableTextFormFeild(
                      onTap: () {
                        controller.controllerHandler?.value =
                            controller.integralValueController.value;
                      },
                      headingText: "Equation",
                      controller: controller.integralValueController.value,
                      trailingIcon: ReusableElevatedButton(
                        onPressed: (){
                          controller.calculateIntegrationUsingCalulus();
                        },
                        text: "Calculate",
                      ),
                    )
                  ],
                ),
              ),
              //============================Show Value Container============================
              Container(
                height: 100,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                padding: EdgeInsets.fromLTRB(10, 7, 10, 0),
                decoration: BoxDecoration(
                    color:Singleton().isDark == true
                        ? Theme.of(context).cardColor
                        : Color.fromARGB(255, 132, 223, 135),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Obx(() => ReusableText(
                              color: Theme.of(context).primaryColor,
                              text: controller.uperLimitValue.value)),
                          Image.asset(
                            'images/integral.png',
                            height: 50,
                            color: Theme.of(context).primaryColor,
                          ),
                          Obx(() => ReusableText(
                              color: Theme.of(context).primaryColor,
                              text: controller.lowerLimitValue.value))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(() => ReusableText(
                            color: Theme.of(context).primaryColor,
                            text: controller.integralValue.value,
                            fontSize: 25,
                          )),
                    ),
                    Expanded(
                      child: Obx(() => Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ReusableText(
                                  color: Theme.of(context).primaryColor,
                                  text: " d",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                              ReusableText(
                                color: Theme.of(context).primaryColor,
                                text: "(${controller.respectTo.value})",
                                fontSize: 25,
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
              //============================KEYBOARD CONTAINER=====================================
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.keyboardButtons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent:
                                MediaQuery.of(context).size.height / 18,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            crossAxisCount: 5),
                        itemBuilder: (context, index) {
                          return ReusableKeyboardButtons(
                              backgroundColor: Theme.of(context).cardColor,
                              text: controller.keyboardButtons[index],
                              textColor: controller.keyboardColor[index],
                              onPressed: () {
                                controller.index = index;
                                controller.type();
                              });
                        }),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
