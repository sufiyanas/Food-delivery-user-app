import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/dbFunctions/cart.dart';
import 'package:food_deliever_app/core/dbFunctions/order_function.dart';
import 'package:food_deliever_app/infrasrructure/cart_modal.dart';

import 'package:food_deliever_app/presentation/cart/widget/place_order_row.dart';
import 'package:food_deliever_app/presentation/widget/cutom_back_icon.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';

class ConformOrderScreen extends StatelessWidget {
  ConformOrderScreen(
      {super.key,
      required this.totoalCount,
      required this.priceList,
      required this.cartList,
      required this.userAddress});
  final int totoalCount;
  final List<String> priceList;
  final List<CartModal> cartList;
  final String userAddress;
  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomBackIcon(),
          Text(
            "Conform Order",
            style: TextStyle(fontFamily: fontBold, fontSize: 25),
          ),
          Container(
            width: mwidth - 20,
            height: mwidth / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade800),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       "Delever To",
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //     TextButton(onPressed: () {}, child: const Text("Edit"))
                  //   ],
                  // ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor:
                              Colors.orange.shade600.withOpacity(0.5),
                          radius: 20,
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.orange,
                          )),
                      kwidth10,
                      SizedBox(
                        width: mwidth / 2,
                        child: Text(
                          userAddress,
                          style: TextStyle(
                              fontFamily: fontBold,
                              fontSize: 15,
                              wordSpacing: 5,
                              letterSpacing: 0.5),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          PlaceOrderCard(
              navigateFunction: () async {
                final currentuserEmail =
                    FirebaseAuth.instance.currentUser!.email;
                //oder dummy
                //placeOrder();
              },
              mwidth: mwidth,
              totoalCount: totoalCount,
              priceList: priceList),
        ],
      ),
    ));
  }

  //place order

  placeOrder() {
    final useremail = FirebaseAuth.instance.currentUser!.email;
    for (var order in cartList) {
      addToOrder(cartModal: order, userEmail: useremail!);
      log('item added : ${order.dishname}');
    }
  }
}
