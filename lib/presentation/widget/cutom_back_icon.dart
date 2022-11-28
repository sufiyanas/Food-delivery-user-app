import 'package:flutter/material.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.brown, borderRadius: BorderRadius.circular(20)),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.orange,
        ),
      ),
    );
  }
}
