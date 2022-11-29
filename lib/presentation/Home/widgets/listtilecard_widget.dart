import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';

class ListtileCard extends StatelessWidget {
  const ListtileCard({
    Key? key,
    required this.mwidth,
    required this.amount,
  }) : super(key: key);

  final double mwidth;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: mwidth - 10,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade800),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset("Asset/home/foodOne.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Herbal pancake",
                  style: TextStyle(fontFamily: fontBold, fontSize: 17),
                ),
                khight5,
                Text(
                  "Warung Herbal",
                  style: TextStyle(
                      fontFamily: fontBook, fontSize: 17, color: Colors.grey),
                )
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "\$${amount}",
              style: TextStyle(color: Colors.orange, fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}
