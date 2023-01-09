import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {Key? key,
      required this.text,
      required this.leadingicon,
      this.ontapfunction})
      : super(key: key);
  final String text;
  final IconData leadingicon;
  final Function()? ontapfunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapfunction,
      child: Row(
        children: [
          Icon(
            leadingicon,
            color: kthemeGreen,
          ),
          kwidth10,
          Text(
            text,
            style: TextStyle(color: Colors.grey.shade100, fontSize: 25),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: kthemeGreen,
          )
        ],
      ),
    );
  }
}
