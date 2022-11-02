import 'dart:async';
import 'dart:math';
import 'package:calculus/calculus.dart';
import 'package:expressions/expressions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homeController extends GetxController {
  Rx<TextEditingController> integralValueController =
      TextEditingController().obs;
  Rx<String> respectTo = "x".obs;
  RxList<String> respectToItems = ['x', 'y', 'z', 'a', 'b', 'c'].obs;
  Rx<TextEditingController> uperLimitController = TextEditingController().obs;
  Rx<TextEditingController> lowerLimitController = TextEditingController().obs;
  Rx<TextEditingController>? controllerHandler = TextEditingController().obs;
  int index = 0;
  RxString integralValue = "".obs;
  RxString uperLimitValue = "".obs;
  RxString lowerLimitValue = "".obs;
  List<String> keyboardButtons = [
    "sin",
    "cos",
    "tan",
    "a",
    "x",
    "cosec",
    "sec",
    "cot",
    "b",
    "y",
    "ln",
    "e",
    "sqrt",
    "c",
    "z",
    "7",
    "8",
    "9",
    "Del",
    "C",
    "4",
    "5",
    "6",
    "(",
    ")",
    "1",
    "2",
    "3",
    "*",
    "/",
    ".",
    "0",
    "^",
    "+",
    "-",
  ];
  List<Color> keyboardColor = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.green,
    Colors.green,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.green,
    Colors.green,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.green,
    Colors.green,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];
  var context = {
    'x': pi / 5,
    'cos': cos,
    'sin': sin,
    'tan': tan,
    'sec': asin,
    'cosec': acos,
    'cot': atan,
    'ln':log
  };
  @override
  void onInit() {
    super.onInit();
    Timer.periodic(Duration(microseconds: 100000), (timer) {
      uperLimitValue.value = uperLimitController.value.text;
      lowerLimitValue.value = lowerLimitController.value.text;
      integralValue.value = integralValueController.value.text;
    });
  }

//-------------------------method used for typing in textformfeild using keyboard------------------------
  RxString type() {
    if (keyboardButtons[index] == "C") {
      controllerHandler?.value.text = "";
    } else if (keyboardButtons[index] == "Del" &&
        controllerHandler?.value.text.isEmpty == false) {
      controllerHandler?.value.text = controllerHandler!.value.text
          .substring(0, controllerHandler!.value.text.length - 1);
    } else if (keyboardButtons[index] == "sin" ||
        keyboardButtons[index] == "cos" ||
        keyboardButtons[index] == "tan" ||
        keyboardButtons[index] == "sec" ||
        keyboardButtons[index] == "cosec" ||
        keyboardButtons[index] == "cot") {
      controllerHandler?.value.text =
          controllerHandler!.value.text + keyboardButtons[index] + "(";
    } else if (keyboardButtons[index] != "Del") {
      controllerHandler?.value.text =
          controllerHandler!.value.text + keyboardButtons[index];
    }
    controllerHandler?.value.selection = TextSelection.fromPosition(
        TextPosition(offset: controllerHandler!.value.text.length));
    return controllerHandler!.value.text.obs;
  }

  void calculateIntegrationUsingCalulus() {
    print(integralValueController.value.text);
    final evaluator = const ExpressionEvaluator();
    Expression expression =
        Expression.parse("ln(10)");
    var r = evaluator.eval(expression, context);
    print("r");
    print(r);
    var result = Calculus.integral(int.parse(lowerLimitValue.value),
        int.parse(uperLimitValue.value), (p0) => r, 1);
        print("result");
    print(result);
  }
}
