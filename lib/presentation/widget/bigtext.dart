import 'package:flutter/cupertino.dart';
import 'package:food_deliever_app/core/const.dart';

class BigTextWithBold extends StatelessWidget {
  const BigTextWithBold({super.key, required this.text, this.fontsize = 20});
  final String text;
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontBold,
        fontSize: fontsize,
      ),
    );
  }
}
