import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';

class CustumTextstyleWidget extends StatelessWidget {
  const CustumTextstyleWidget(
      {super.key,
      required this.titletext1,
      required this.titletext2,
      required this.subtext1,
      required this.subtext2});
  final titletext1;
  final titletext2;
  final subtext1;
  final subtext2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$titletext1",
          style: TextStyle(fontFamily: fontBold, fontSize: 25),
        ),
        khight5,
        Text(
          "$titletext2",
          style: TextStyle(fontFamily: fontBold, fontSize: 25),
        ),
        khight20,
        Text(
          "$subtext1",
          style: TextStyle(fontFamily: fontBook, fontSize: 20),
        ),
        khight5,
        Text(
          "$subtext2",
          style: TextStyle(fontFamily: fontBook, fontSize: 20),
        ),
      ],
    );
  }
}
