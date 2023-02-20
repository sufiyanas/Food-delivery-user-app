import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/utils.dart';
import 'package:food_deliever_app/infrasrructure/cart_modal.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/presentation/Detail%20Menu/detail_menu_screen.dart';

class FavorateList extends StatelessWidget {
  FavorateList({
    Key? key,
    required this.mwidth,
    required this.item,
  }) : super(key: key) {
    _doucumentReferance =
        FirebaseFirestore.instance.collection("user").doc(currentUser.email);
    _refferancecolloction =
        _doucumentReferance.collection("cart").doc(item.dishname);
  }
  final currentUser = FirebaseAuth.instance.currentUser!;
  final double mwidth;
  final FoodModal item;
  final bool isAvailable = false;
  late DocumentReference _doucumentReferance;
  late DocumentReference _refferancecolloction;
  @override
  Widget build(BuildContext context) {
    if (item.isAvailable == true) {
      isAvailable == true;
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailMenuScreen(user: item),
            ));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        width: mwidth,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            kwidth10,
            Container(
              width: mwidth * 0.25,
              height: mwidth * 0.20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(item.imageURL))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.dishname,
                      style: TextStyle(fontFamily: fontBold, fontSize: 15)),
                  khight5,
                  (isAvailable)
                      ? Text(" Available",
                          style: TextStyle(color: Colors.grey, fontSize: 15))
                      : Text("Not Available",
                          style: TextStyle(color: Colors.grey, fontSize: 15)),
                  Text(
                    "\$ ${item.offerPrice}",
                    style: TextStyle(color: kthemeGreen, fontSize: 21),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                final CartModal cartitem = CartModal(
                  hotalEmail: item.hotalEmail,
                  dishname: item.dishname,
                  isItemAddedInCart: true,
                  imageURL: item.imageURL,
                  offerPrice: item.offerPrice,
                  orginalPrice: item.orginalPrice,
                );
                await _refferancecolloction.set(cartitem.toJson());
                Utils.customSnackbar(
                    context: context,
                    text: "${item.dishname} Added to cart",
                    type: AnimatedSnackBarType.success);
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kthemeGreen),
                child: Center(
                    child: Text(
                  "Buy Again",
                  style: TextStyle(
                    fontFamily: fontBold,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
