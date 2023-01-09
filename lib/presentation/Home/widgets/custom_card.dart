import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/dbFunctions/restarent_view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.mwidth,
    required this.restarentEmail,
  }) : super(key: key);

  final double mwidth;
  final String restarentEmail;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getRestaurentdetails(restarentEmail: restarentEmail).first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong"));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Container(
              width: mwidth / 2 - 30,
              // height: mwidth / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: kthemeGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      data[0].imageURL,
                      fit: BoxFit.contain,
                      // width: mwidth / 2,
                      //height: mwidth / 2,
                    ),
                  ),
                  khight10,
                  Text(
                    data[0].restaurantname,
                    style: TextStyle(fontFamily: fontBold, fontSize: 18),
                  ),
                  khight5,
                  // Text(
                  //   "1 Km",
                  //   style: TextStyle(
                  //     fontFamily: fontBook,
                  //   ),
                  // )
                ],
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
