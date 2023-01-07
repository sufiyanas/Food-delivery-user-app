//add to order

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_deliever_app/infrasrructure/cart_modal.dart';
import 'package:food_deliever_app/infrasrructure/order_modal.dart';
import 'package:food_deliever_app/infrasrructure/user_modal.dart';

Future<void> addToOrder(
    {required CartModal cartModal, required String userEmail}) async {
  final userAddress = await getUserAddress(userEmail: userEmail);

  final orderRefferance = FirebaseFirestore.instance
      .collection("Restaurent")
      .doc(cartModal.hotalEmail)
      .collection("Orders")
      .doc();

  final order = OrderModal(
      userAddress: userAddress[0].location,
      userEmail: userEmail,
      hotalEmail: cartModal.hotalEmail,
      dishname: cartModal.dishname,
      orginalPrice: cartModal.orginalPrice,
      imageURL: cartModal.imageURL,
      cartCount: cartModal.cartCount);
  final json = order.toJson();
  await orderRefferance.set(json);
}

Future<List<UserModal>> getUserAddress({required String userEmail}) {
  return FirebaseFirestore.instance
      .collection("user")
      .doc(userEmail)
      .collection("UserDetails")
      .snapshots()
      .map((snapShots) => snapShots.docs
          .map((docs) => UserModal.fromjson(docs.data()))
          .toList())
      .first;
}
