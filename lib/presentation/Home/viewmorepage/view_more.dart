import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/presentation/Home/home.dart';
import 'package:food_deliever_app/presentation/Home/widgets/listtilecard_widget.dart';
import 'package:food_deliever_app/presentation/Notification/notification_screen.dart';
import 'package:food_deliever_app/presentation/widget/bigtext.dart';
import 'package:food_deliever_app/presentation/widget/custom_app_bar.dart';

class ViewMoreScreen extends StatelessWidget {
  const ViewMoreScreen({super.key});
  final double mwidth = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            builder: (context) => (const NotificationScreen()),
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
                const BigTextWithBold(text: "Popular menu"),
                StreamBuilder<List<FoodModal>>(
                  stream: fetchFoood(CollectionName: "food"),
                  builder: (context, snapShot) {
                    final users = snapShot.data!;
                    if (snapShot.hasData) {
                      return ListView(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        children: users.map(listrilebuldcard).toList(),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
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
