import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';

class Textfieldwidget extends StatelessWidget {
  const Textfieldwidget(
      {Key? key,
      required this.labeltext,
      required this.prefixicon,
      this.suffixicon})
      : super(key: key);
  final String labeltext;
  final Widget prefixicon;
  final Widget? suffixicon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade800,
          suffixIcon: suffixicon ?? SizedBox(),
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.greenAccent),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: OutlineInputBorder(),
          // fillColor: kthemeGreen,
          hoverColor: kthemeGreen,
          focusColor: kthemeGreen,
          labelText: labeltext,
          prefixIcon: prefixicon),
    );
  }
}
