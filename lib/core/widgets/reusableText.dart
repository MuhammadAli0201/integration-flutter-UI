import 'package:flutter/cupertino.dart';

class ReusableText extends StatelessWidget {
  String? text;
  double? fontSize;
  Color? color;
  var fontWeight;
  ReusableText({this.color,required this.text,this.fontSize,this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color
    ),);
  }
}