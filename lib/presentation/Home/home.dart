import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/presentation/Home/viewmorepage/view_more.dart';
import 'package:food_deliever_app/presentation/Home/widgets/custom_card.dart';
import 'package:food_deliever_app/presentation/Home/widgets/listtilecard_widget.dart';
import 'package:food_deliever_app/presentation/Notification/notification_screen.dart';
import 'package:food_deliever_app/presentation/widget/custom_app_bar.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var amount = 5;
  final double mwidth = 100;
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final mwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
          child: Column(
            children: [
              khight20,
              CustomAppBar(
                textone: "Find Your",
                texttwo: "Favorate Food",
                actionButton: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => (NotificationScreen()),
                        ));
                      },
                      icon: Badge(
                        badgeColor: Colors.red,
                        child: Icon(
                          Icons.notifications_none,
                          size: 30,
                          color: kthemeGreen,
                        ),
                      ),
                    )),
              ),
              Textfieldwidget(
                controller: searchController,
                onchnaged: (p0) {},
                labeltext: "What do you want to order?",
                prefixicon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              khight20,
              Expanded(
                child: ListView(children: [
                  Image.asset("Asset/home/adone.png"),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Nearest Restarent",
                        style: TextStyle(fontFamily: fontBold, fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text("View More"))
                    ],
                  ),
                  // CustomCard(mwidth: mwidth)
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Menu",
                        style: TextStyle(fontFamily: fontBold, fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewMoreScreen(),
                                ));
                          },
                          child: const Text(
                            "View More",
                            style: TextStyle(color: Colors.orange),
                          ))
                    ],
                  ),
                  StreamBuilder<List<FoodModal>>(
                    stream: fetchFoood(CollectionName: "food"),
                    builder: (context, snapShot) {
                      // final users = snapShot.data!;
                      log(snapShot.toString());

                      if (snapShot.hasData) {
                        final userss = snapShot.data!;
                        log(userss.toString());
                        if (userss.isEmpty) {
                          return Text("Please Add some food");
                        }
                        return ListView(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          children: userss.map(listrilebuldcard).toList(),
                        );
                      } else {
                        return Center(child: Text("please add some data"));
                      }
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listrilebuldcard(FoodModal user) {
    return ListtileCard(
      mwidth: mwidth,
      users: user,
    );
  }
}
