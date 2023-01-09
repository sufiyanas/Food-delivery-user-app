import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';

class TextFormfireldContiner extends StatelessWidget {
  const TextFormfireldContiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 200,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          kwidth10,
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          kwidth10,
          Text(
            "What do you want to order?",
            style: TextStyle(color: Colors.grey, fontSize: 16),
          )
        ],
      ),
    );
  }
}
