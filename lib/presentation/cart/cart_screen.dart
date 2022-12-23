import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/presentation/cart/widget/place_order_row.dart';
import 'package:food_deliever_app/presentation/cart/widget/product_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final double mwidthfortile = 100;
  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            khight20,
            khight20,
            Text(
              "Order Details",
              style: TextStyle(fontFamily: fontBold, fontSize: 30),
            ),
            Expanded(
              child: Stack(
                children: [
                  StreamBuilder<List<User>>(
                    stream: fetchFoood(CollectionName: "cart"),
                    builder: (context, snapShot) {
                      final users = snapShot.data!;

                      if (snapShot.hasData) {
                        return ListView(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          children: users.map(listrilebuldcard).toList(),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: PlaceOrderCard(mwidth: mwidth),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listrilebuldcard(
    User user,
  ) {
    return CartProductTile(
      mwidth: mwidthfortile,
      user: user,
    );
  }
}

//for creating user
Future createUsermethod(User user) async {
  final docUser = FirebaseFirestore.instance.collection("cart").doc();
  user.id = docUser.id;

  final json = user.toJson();
  await docUser.set(json);
}
