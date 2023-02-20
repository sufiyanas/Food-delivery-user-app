import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard({
    Key? key,
    required this.mwidth,
  }) : super(key: key);

  final double mwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: mwidth,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Image.asset(
            "Asset/profile/Voucher Icon.png",
            height: 150,
            width: 100,
          ),
          Text("You have 3 voucher ",
              style: TextStyle(fontFamily: fontBold, fontSize: 15)),
        ],
      ),
    );
  }
}
