import 'package:flutter/material.dart';

class ItemCartSearchScreen extends StatelessWidget {
  const ItemCartSearchScreen(
      {super.key, required this.text, required this.ontapfunction});
  final String text;
  final Function() ontapfunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapfunction,
      child: Container(
        margin: EdgeInsets.all(20),
        width: 100,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
