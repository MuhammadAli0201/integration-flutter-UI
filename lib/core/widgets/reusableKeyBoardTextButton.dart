import 'package:flutter/material.dart';
import 'package:integration_project/core/widgets/reusableText.dart';

class ReusableKeyboardButtons extends StatelessWidget {
  String? text;
  Function()? onPressed;
  Color? textColor;
  Color? backgroundColor;

  ReusableKeyboardButtons({required this.text,this.backgroundColor,this.textColor,required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: text=="Del"||text=="C"?Colors.red:backgroundColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextButton(
          onPressed: onPressed,
          child: ReusableText(
           text: text!,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color:textColor==null?Colors.black:textColor,
          )),
    );
  }
}
