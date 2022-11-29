import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Home/widgets/listtilecard_widget.dart';
import 'package:food_deliever_app/presentation/widget/custom_app_bar.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var amount = 5;

  @override
  Widget build(BuildContext context) {
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
                child: Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: kthemeGreen,
                ),
              ),
            ),
            const Textfieldwidget(
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
                    TextButton(onPressed: () {}, child: const Text("View More"))
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
                        onPressed: () {},
                        child: const Text(
                          "View More",
                          style: TextStyle(color: Colors.orange),
                        ))
                  ],
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListtileCard(mwidth: mwidth, amount: index);
                  },
                ),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.mwidth,
  }) : super(key: key);

  final double mwidth;

  @override
  Widget build(BuildContext context) {
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
          Image.asset(
            "Asset/home/hotalLogo one.png",
            // width: mwidth / 2,
            //height: mwidth / 2,
          ),
          khight10,
          Text(
            "Vegan Resto",
            style: TextStyle(fontFamily: fontBold, fontSize: 18),
          ),
          khight5,
          Text(
            "1 Km",
            style: TextStyle(
              fontFamily: fontBook,
            ),
          )
        ],
      ),
    );
  }
}
