import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.mwidth,
  }) : super(key: key);

  final double mwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mwidth / 2 - 30,
      // height: mwidth / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: kthemeGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "Asset/home/hotalLogo one.png",
            // width: mwidth / 2,
            //height: mwidth / 2,
          ),
          khight10,
          Text(
            "Vegan Resto",
            style: TextStyle(fontFamily: fontBold, fontSize: 18),
          ),
          khight5,
          Text(
            "1 Km",
            style: TextStyle(
              fontFamily: fontBook,
            ),
          )
        ],
      ),
    );
  }
}
