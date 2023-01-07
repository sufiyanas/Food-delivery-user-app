import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/dbFunctions/favorate.dart';
import 'package:food_deliever_app/core/utils.dart';
import 'package:food_deliever_app/infrasrructure/cart_modal.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/presentation/Home/widgets/custom_card.dart';
import 'package:food_deliever_app/presentation/Profile/profile_screen.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';

class DetailMenuScreen extends StatelessWidget {
  DetailMenuScreen({super.key, required this.user}) {
    _doucumentReferance =
        FirebaseFirestore.instance.collection("user").doc(currentUser.email);
    _refferancecolloction =
        _doucumentReferance.collection("cart").doc(user.dishname);
  }
  final FoodModal user;
  final currentUser = FirebaseAuth.instance.currentUser!;
  late DocumentReference _doucumentReferance;
  late DocumentReference _refferancecolloction;
  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: mwidth,
            height: mwidth + 20,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(user.imageURL), fit: BoxFit.cover)),
          ),
        ),
        SizedBox.expand(
          child: DraggableScrollableSheet(
            maxChildSize: 0.9,
            minChildSize: 0.50,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: kthemeBlack,
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        width: 50,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: Colors.grey.shade800,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.green.shade300.withOpacity(0.3)),
                            child: Center(
                              child: Text(
                                "Popular",
                                style: TextStyle(color: kthemeGreen),
                              ),
                            ),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor:
                                Colors.green.shade300.withOpacity(0.3),
                            radius: 20,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.location_on,
                                  color: kthemeGreen,
                                )),
                          ),
                          kwidth10,
                          StreamBuilder(
                              stream: getStreamFavorate(
                                  userEmail: currentUser.email!),
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Text("Some thing went wrong"),
                                  );
                                } else if (snapshot.hasData) {
                                  final favList = snapshot.data;
                                  return CircleAvatar(
                                    backgroundColor:
                                        Colors.red.shade300.withOpacity(0.3),
                                    radius: 20,
                                    child: IconButton(
                                      onPressed: () {
                                        if (favList
                                            .where((element) =>
                                                element.dishname ==
                                                user.dishname)
                                            .isEmpty) {
                                          addToFavorate(
                                              userEmail: currentUser.email!,
                                              foodModal: user);
                                          log("Added to favorate");
                                        } else {
                                          removeFromFavorate(
                                              userEmail: currentUser.email!,
                                              foodModal: user);
                                          log("Removed from favorate");
                                        }
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: (favList!
                                                .where((element) =>
                                                    element.dishname ==
                                                    user.dishname)
                                                .isEmpty)
                                            ? Colors.white
                                            : Colors.red,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.dishname,
                                    style: TextStyle(
                                        fontFamily: fontBold, fontSize: 27)),
                                khight10,
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_half,
                            color: kthemeGreen,
                          ),
                          kwidth5,
                          const Text(
                            "4.8 Rating",
                            style: TextStyle(color: Colors.grey),
                          ),
                          kwidth10,
                          Icon(
                            Icons.shopping_bag_rounded,
                            color: kthemeGreen,
                          ),
                          const Text(
                            "2000 + Order",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Text(
                          user.aboutdish,
                          style: TextStyle(
                            color: Colors.grey,
                            wordSpacing: 0.8,
                            letterSpacing: 0.3,
                            fontSize: 17,
                            fontFamily: fontBook,
                          ),
                        ),
                      ),
                      khight10,
                      Row(
                        children: [
                          Text(
                            "Popular Menu",
                            style:
                                TextStyle(fontFamily: fontBold, fontSize: 20),
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "View All",
                              )),
                        ],
                      ),
                      SizedBox(
                        height: mwidth / 2 + 30,
                        width: double.infinity,
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomCard(mwidth: mwidth),
                          ),
                        ),
                      ),
                      // Spacer(),
                      khight20,
                      CutomMaterialButton(
                          onpressed: () async {
                            //  if (cartitem.isItemAddedInCart==true) {

                            //   }
                            // createUsermethod(user);
                            final CartModal cartitem = CartModal(
                              hotalEmail: user.hotalEmail,
                              dishname: user.dishname,
                              isItemAddedInCart: true,
                              imageURL: user.imageURL,
                              offerPrice: user.offerPrice,
                              orginalPrice: user.orginalPrice,
                            );

                            await _refferancecolloction.set(cartitem.toJson());

                            // log(respponse);
                            Utils.customSnackbar(
                                context: context,
                                text: "${user.dishname} Added to cart",
                                type: AnimatedSnackBarType.success);
                          },
                          text: "Add to cart",
                          width: mwidth - 10)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}

// add to cart
// Future createUsermethod(FoodModal user) async {
//   final docUser = FirebaseFirestore.instance.collection("cart").doc();
//   user.id = docUser.id;

//   final json = user.toJson();
//   await docUser.set(json);
// }
