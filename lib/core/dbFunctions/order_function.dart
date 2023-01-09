//add to order
import 'dart:developer';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_deliever_app/core/dbFunctions/restarent_view.dart';
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
      .doc(cartModal.dishname);

  final order = OrderModal(
    trackOrder: 0,
    isCompleated: false,
    userAddress: userAddress[0].location,
    userEmail: userEmail,
    hotalEmail: cartModal.hotalEmail,
    dishname: cartModal.dishname,
    orginalPrice: cartModal.orginalPrice,
    imageURL: cartModal.imageURL,
    cartCount: cartModal.cartCount,
  );
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

// Future<List<OrderModal>> getOrderdetails() async {
//   List<OrderModal> ordersList = [];
//   List<String> restaurentEmailList = await getallRestaurent();

//   for (var restaurentEmail in restaurentEmailList) {
//     log(restaurentEmail);
//     final pertcularOrderList = await FirebaseFirestore.instance
//         .collection("Restaurent")
//         .doc(restaurentEmail)
//         .collection("Orders")
//         .snapshots()
//         .map((snapshots) => snapshots.docs
//             .map((doc) => OrderModal.fromJson(doc.data()))
//             .toList())
//         .first;
//     log("11223");
//     log(pertcularOrderList.toString());
//     for (var order in pertcularOrderList) {
//       ordersList.add(order);
//       log(order.toString());
//     }
//   }
//   return ordersList;
// }

//to create  a  new collection on firebase for Orders

addOrdersToFirebase({
  required CartModal cartModal,
  required String userEmail,
}) async {
  final collectionreff =
      FirebaseFirestore.instance.collection("Orders").doc(cartModal.dishname);
  final userAddress = await getUserAddress(userEmail: userEmail);
  final order = OrderModal(
    trackOrder: 0,
    isCompleated: false,
    userAddress: userAddress[0].location,
    userEmail: userEmail,
    hotalEmail: cartModal.hotalEmail,
    dishname: cartModal.dishname,
    orginalPrice: cartModal.orginalPrice,
    imageURL: cartModal.imageURL,
    cartCount: cartModal.cartCount,
  );

  final json = order.toJson();
  await collectionreff.set(json);
}
