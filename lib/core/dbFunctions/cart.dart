import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_deliever_app/infrasrructure/cart_modal.dart';

Future addFoodToCart({required CartModal cartModel}) async {
  final email = FirebaseAuth.instance.currentUser!.email;

  //doc Reference
  final _doucumentReferance = FirebaseFirestore.instance
      .collection("user")
      .doc(email)
      .collection("cart")
      .doc(cartModel.dishname);
  //intstance for the model
  final cartModelData = CartModal(
    hotalEmail: cartModel.hotalEmail,
    dishname: cartModel.dishname,
    orginalPrice: cartModel.orginalPrice,
    offerPrice: cartModel.offerPrice,
    imageURL: cartModel.imageURL,
  );

  //json
  final cartDataJson = cartModelData.toJson();

  //add to FB
  _doucumentReferance.set(cartDataJson);
}

Future editCartCount({required CartModal cartModal}) async {
  final email = FirebaseAuth.instance.currentUser!.email;

  //doc Reference
  final _doucumentReferance = FirebaseFirestore.instance
      .collection("user")
      .doc(email)
      .collection("cart")
      .doc(cartModal.dishname);

  final editedCartCount = CartModal(
    hotalEmail: cartModal.hotalEmail,
    cartCount: cartModal.cartCount,
    dishname: cartModal.dishname,
    orginalPrice: cartModal.orginalPrice,
    offerPrice: cartModal.offerPrice,
    imageURL: cartModal.imageURL,
  );

  //json
  final cartEditedJson = editedCartCount.toJson();

  //add to FB
  _doucumentReferance.update(cartEditedJson);
}
