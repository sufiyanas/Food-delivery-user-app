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

class BigTextWithnormal extends StatelessWidget {
  const BigTextWithnormal(
      {super.key,
      required this.text,
      this.fontsize = 20,
      this.textDecoration = TextDecoration.none});
  final String text;
  final double fontsize;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontBook, fontSize: fontsize, decoration: textDecoration),
    );
  }
}
