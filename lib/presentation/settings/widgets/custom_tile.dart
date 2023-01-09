import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/infrasrructure/order_modal.dart';

class ListtileCardwidget extends StatelessWidget {
  const ListtileCardwidget({
    Key? key,
    required this.mwidth,
    // required this.users,
    required this.ontap,
    required this.orderModal,
  }) : super(key: key);

  final OrderModal orderModal;
  final double mwidth;
  // final FoodModal users;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: mwidth - 10,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade800),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                width: mwidth / 2 + 50,
                height: mwidth / 2 + 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(orderModal.imageURL))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderModal.dishname,
                    style: TextStyle(fontFamily: fontBold, fontSize: 17),
                  ),
                  khight5,
                  // Text(
                  //   " users.dishname",
                  //   style: TextStyle(
                  //       fontFamily: fontBook, fontSize: 17, color: Colors.grey),
                  // )
                ],
              ),
            ),
            const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(right: 20),
            //   child: Text(
            //     " users.offerPrice",
            //     style: const TextStyle(color: Colors.orange, fontSize: 25),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
