import 'package:flutter/material.dart';
import 'package:integration_project/core/widgets/reusableText.dart';

class ReusableElevatedButton extends StatelessWidget {
  Function()? onPressed;
  String? text;
  ReusableElevatedButton({required this.onPressed,required this.text, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: Colors.green,
        borderRadius:BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)) 
      ),
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: TextButton(onPressed: onPressed, child: ReusableText(text:text!,fontWeight: FontWeight.bold,color: Colors.white)));
  }
}
