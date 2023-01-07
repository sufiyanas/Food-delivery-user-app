import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/dbFunctions/order_function.dart';
import 'package:food_deliever_app/infrasrructure/cart_modal.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/presentation/OrderService/conform_order_screen.dart';
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
              child: StreamBuilder<List<CartModal>>(
                stream: fetchFoodfromcart(currentUser.email.toString()),
                builder: (context, snapShot) {
                  List<String> pricelist = [];
                  if (snapShot.hasData) {
                    final cartList = snapShot.data!;
                    for (var element in cartList) {
                      pricelist.add(element.orginalPrice);
                    }
                    log(pricelist.toString());
                    if (snapShot.hasError) {
                      Text("something wend wrong");
                    } else if (cartList.isEmpty) {
                      isCartEmpty = true;
                      return Center(
                        child: Text("Add some product to cart"),
                      );
                    }
                    return Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            // physics: const ScrollPhysics(),
                            // shrinkWrap: true,
                            children: cartList
                                .map(
                                  (e) => listrilebuldcard(e),
                                )
                                .toList(),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: PlaceOrderCard(
                            totoalCount: cartList.length,
                            mwidth: mwidth,
                            priceList: pricelist,
                            navigateFunction: () async {
                              final userAddress = await getUserAddress(
                                  userEmail: currentUser.email!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ConformOrderScreen(
                                      cartList: cartList,
                                      totoalCount: cartList.length,
                                      priceList: pricelist,
                                      userAddress: userAddress[0].location,
                                    ),
                                  ));
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget listrilebuldcard(
    CartModal user,
  ) {
    return CartProductTile(
      mwidth: mwidthfortile,
      user: user,
    );
  }
}
