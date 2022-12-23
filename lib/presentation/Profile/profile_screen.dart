import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final mwidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: mwidth,
          height: mwidth + 20,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Asset/profile/Photo Profile.png"),
                  fit: BoxFit.cover)),
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
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.orange.shade300.withOpacity(0.3)),
                          child: const Center(
                            child: Text(
                              "Member Gold",
                              style: TextStyle(color: Colors.amber),
                            ),
                          ),
                        ),
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
                              Text("Anam Wusono ",
                                  style: TextStyle(
                                      fontFamily: fontBold, fontSize: 27)),
                              khight10,
                              Text(
                                user.email!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.edit,
                                color: kthemeGreen,
                              ))
                        ],
                      ),
                    ),
                    VoucherCard(mwidth: mwidth),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Row(
                        children: [
                          Text("Favorate",
                              style: TextStyle(
                                  fontFamily: fontBold, fontSize: 15)),
                        ],
                      ),
                    ),
                    FavorateList(mwidth: mwidth),
                    FavorateList(mwidth: mwidth),
                    FavorateList(mwidth: mwidth),
                    FavorateList(mwidth: mwidth),
                    FavorateList(mwidth: mwidth),
                    FavorateList(mwidth: mwidth),
                    FavorateList(mwidth: mwidth)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}

class VoucherCard extends StatelessWidget {
  const VoucherCard({
    Key? key,
    required this.mwidth,
  }) : super(key: key);

  final double mwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: mwidth,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Image.asset(
            "Asset/profile/Voucher Icon.png",
            height: 150,
            width: 100,
          ),
          Text("You have 3 voucher ",
              style: TextStyle(fontFamily: fontBold, fontSize: 15)),
        ],
      ),
    );
  }
}

class FavorateList extends StatelessWidget {
  const FavorateList({
    Key? key,
    required this.mwidth,
  }) : super(key: key);

  final double mwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: mwidth,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset("Asset/profile/Photo Menu.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("spacy fresh crab",
                    style: TextStyle(fontFamily: fontBold, fontSize: 15)),
                khight5,
                const Text("Waroenk kita",
                    style: TextStyle(color: Colors.grey, fontSize: 15)),
                Text(
                  "35",
                  style: TextStyle(color: kthemeGreen, fontSize: 21),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: kthemeGreen),
            child: Center(
                child: Text(
              "Buy Again",
              style: TextStyle(
                fontFamily: fontBold,
              ),
            )),
          )
        ],
      ),
    );
  }
}
