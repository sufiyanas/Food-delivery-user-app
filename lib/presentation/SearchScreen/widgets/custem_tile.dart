import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    required this.mwidth,
    required this.foodmodel,
  }) : super(key: key);

  final double mwidth;
  final FoodModal foodmodel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => (DetailMenuScreen(
        //         user: users,
        //       )),
        //     ));
      },
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
                        image: NetworkImage(foodmodel.imageURL))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodmodel.dishname,
                    style: TextStyle(fontFamily: fontBold, fontSize: 17),
                  ),
                  khight5,
                  Text(
                    foodmodel.hotalEmail,
                    style: TextStyle(
                        fontFamily: fontBook, fontSize: 17, color: Colors.grey),
                  )
                ],
              ),
            ),
            const Spacer(),
            // Padding(
            //   padding: const EdgeInsets.only(right: 20),
            //   child: Text(
            //     users.offerPrice,
            //     style: const TextStyle(color: Colors.orange, fontSize: 25),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
