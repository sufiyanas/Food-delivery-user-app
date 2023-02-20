import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/dbFunctions/restarent_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.mwidth,
    required this.restarentEmail,
    required this.index,
  }) : super(key: key);

  final double mwidth;
  final String restarentEmail;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRestaurentdetails(restarentEmail: restarentEmail).first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong"));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            log(data[0].restaurantname);
            log(data[0].imageURL);
            return Container(
              width: mwidth / 2 - 30,
              // height: mwidth / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: kthemeGrey,
              ),
              child: SizedBox(
                width: 10,
                height: 10,
                child: Container(
                  // width: 10,
                  // height: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(data[0].imageURL),
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      )),
                  child: Text(data[0].restaurantname),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
