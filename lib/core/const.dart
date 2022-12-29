import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/infrasrructure/user_modal.dart';

final String fontBook = "BentonSansBoldBook";
final String fontBold = "BentonSansBold";

//sized box =hight 10

final khight10 = SizedBox(
  height: 10,
);

final khight5 = SizedBox(
  height: 5,
);

final khight20 = SizedBox(
  height: 20,
);

final kwidth5 = SizedBox(
  width: 5,
);

//theame color

final kthemeGreen = Colors.green;
// final kthemeGrey = Color.fromRGBO(244, 244, 244, 100);
final kthemeGrey = Colors.grey.shade800;

final kthemeBlack = Colors.black;
//sizedbox width

final kwidth10 = SizedBox(
  width: 10,
);

final kwidth20 = SizedBox(
  width: 20,
);

//mediaQury width

// mWidthfn(BuildContext ctx) {

// }

Stream<List<FoodModal>> fetchFoood({required String CollectionName}) =>
    FirebaseFirestore.instance.collection(CollectionName).snapshots().map(
        (snapShot) => snapShot.docs
            .map((doc) => FoodModal.fromJson(doc.data()))
            .toList());

//current user
Stream<List<FoodModal>> fetchFoodfromcart(String userEmail) => FirebaseFirestore
    .instance
    .collection('user')
    .doc(userEmail)
    .collection('cart')
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => FoodModal.fromJson(doc.data())).toList());

//fetchFoodFromUserInformation
Stream<List<UserModal>> fetchUserInformation(String userEmail) =>
    FirebaseFirestore.instance
        .collection('user')
        .doc(userEmail)
        .collection('UserDetails')
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => UserModal.fromjson(doc.data()))
            .toList());
