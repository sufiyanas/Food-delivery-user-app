import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/dbFunctions/cart.dart';
import 'package:food_deliever_app/infrasrructure/cart_modal.dart';

class CartProductTile extends StatelessWidget {
  CartProductTile({
    Key? key,
    required this.user,
    required this.mwidth,
    // required this.imageUrl,
    // required this.name,
    // required this.status,
  }) : super(key: key);

  final double mwidth;
  // final String imageUrl;
  // final String name;
  // final String status;
  CartModal user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          user.imageURL,
                        ))),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.dishname,
                style: TextStyle(fontFamily: fontBold, fontSize: 17),
              ),
              Text(
                "hotal_name",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const Spacer(),
          CustomItomCounter(dishName: user.dishname, cartModal: user),
          kwidth10
        ],
      ),
    );
  }
}

class CustomItomCounter extends StatelessWidget {
  CustomItomCounter({
    Key? key,
    required this.dishName,
    required this.cartModal,
  }) : super(key: key);
  final String dishName;
  final CartModal cartModal;
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: fetchcountfromcart(currentUser.email!, dishName),
        builder: (context, snapshot) {
          return Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green.shade600.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    int currentPrice = int.parse(cartModal.orginalPrice);

                    final int newPrize =
                        currentPrice - int.parse(cartModal.offerPrice);
                    final String countedPrize = newPrize.toString();

                    //count
                    int count = cartModal.cartCount;
                    final int newCount = count - 1;

                    editCartCount(
                        cartModal: CartModal(
                      hotalEmail: cartModal.hotalEmail,
                      cartCount: newCount,
                      dishname: cartModal.dishname,
                      orginalPrice: countedPrize,
                      offerPrice: cartModal.offerPrice,
                      imageURL: cartModal.imageURL,
                    ));
                  },
                  child: const Text(
                    "--",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
              kwidth5,
              Text(cartModal.cartCount.toString()),
              kwidth5,
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: IconButton(
                        onPressed: () async {
                          int currentPrice = int.parse(cartModal.orginalPrice);

                          final int newPrize =
                              currentPrice + int.parse(cartModal.offerPrice);
                          final String countedPrize = newPrize.toString();

                          //count
                          int count = cartModal.cartCount;
                          final int newCount = count + 1;

                          editCartCount(
                              cartModal: CartModal(
                            hotalEmail: cartModal.hotalEmail,
                            cartCount: newCount,
                            dishname: cartModal.dishname,
                            orginalPrice: countedPrize,
                            offerPrice: cartModal.offerPrice,
                            imageURL: cartModal.imageURL,
                          ));
                        },
                        icon: const Text(
                          "+",
                          style: TextStyle(fontSize: 15),
                        ))),
              )
            ],
          );
        });
  }
}
