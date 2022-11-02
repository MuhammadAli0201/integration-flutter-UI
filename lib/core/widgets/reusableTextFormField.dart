import 'package:flutter/material.dart';
import 'package:integration_project/core/widgets/reusableText.dart';

class ReusableTextFormFeild extends StatelessWidget {
  TextEditingController? controller;
  String? headingText;
  Function()? onTap;
  Widget? trailingIcon;
  ReusableTextFormFeild(
      {this.onTap,
      this.trailingIcon,
      this.headingText,
      this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 5,
              ),
              ReusableText(
                text: headingText.toString(),
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            child: TextFormField(
              onTap: onTap,
              style: TextStyle(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                  suffixIcon: trailingIcon,
                  filled: true,
                  fillColor: Theme.of(context).secondaryHeaderColor,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              controller: controller,
              keyboardType: TextInputType.none,
            ),
          ),
        ],
      ),
    );
  }
}
