import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/presentation/cart/widget/place_order_row.dart';
import 'package:food_deliever_app/presentation/cart/widget/product_tile.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final currentUser = FirebaseAuth.instance.currentUser!;
  final double mwidthfortile = 100;
  var isCartEmpty = false;

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
                  StreamBuilder<List<FoodModal>>(
                    stream: fetchFoodfromcart(currentUser.email.toString()),
                    builder: (context, snapShot) {
                      if (snapShot.hasData) {
                        final userss = snapShot.data!;
                        if (snapShot.hasError) {
                          Text("something wend wrong");
                        } else if (userss.isEmpty) {
                          isCartEmpty = true;
                          return Center(
                            child: Text("Add some product to cart"),
                          );
                        }
                        return SingleChildScrollView(
                          child: Stack(
                            children: [
                              Column(
                                // physics: const ScrollPhysics(),
                                // shrinkWrap: true,
                                children: userss.map(listrilebuldcard).toList(),
                              ),
                              Visibility(
                                visible: isCartEmpty,
                                child: Positioned(
                                  bottom: 10,
                                  left: 10,
                                  child: PlaceOrderCard(
                                    mwidth: mwidth,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
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
    FoodModal user,
  ) {
    return CartProductTile(
      mwidth: mwidthfortile,
      user: user,
    );
  }
}
