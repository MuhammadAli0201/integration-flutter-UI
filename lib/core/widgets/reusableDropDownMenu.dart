import 'package:flutter/material.dart';
import 'package:integration_project/core/widgets/reusableText.dart';

class ReusableDropDownMenu extends StatelessWidget {
  List<String>? items;
  String? value;
  String? heading;
  Function(String?)? onChange;
  ReusableDropDownMenu({this.onChange,this.items,required this.value,this.heading,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReusableText(
           text: heading.toString(),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(height: 5,),
          DropdownButtonFormField(
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  fillColor:Theme.of(context).secondaryHeaderColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              isDense: true,
              value: value,
              items:items?.map<DropdownMenuItem<String>>(
                      (val) => DropdownMenuItem<String>(
                          value: val,
                          child: ReusableText(
                           text: val,
                           color: Theme.of(context).primaryColor,
                           fontWeight: FontWeight.bold,
                          )))
                  .toList(),
              onChanged: onChange),
              
        ],
      ),
    );
  }
}
