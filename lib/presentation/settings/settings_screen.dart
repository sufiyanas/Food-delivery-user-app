import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/dbFunctions/order_function.dart';
import 'package:food_deliever_app/main.dart';
import 'package:food_deliever_app/presentation/Chat/chatscreen.dart';
import 'package:food_deliever_app/presentation/settings/orders_history_screen.dart';
import 'package:food_deliever_app/presentation/settings/widgets/settings_tile.dart';

import 'package:food_deliever_app/presentation/widget/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var divider = Divider(
      height: 30,
      color: Colors.grey.shade800,
    );
    return SafeArea(
      child: SizedBox(
        child: Column(
          children: [
            // Spacer(
            //   flex: 3,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CustomAppBar(
                textone: "Enjoy your meal",
                texttwo: "Ordering made easy!",
                actionButton: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(17)),
                    child: IconButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Mainpage(),
                              ));
                        },
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: Colors.green,
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
              child: Column(
                children: [
                  SettingsTile(
                      ontapfunction: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderHistoryScreen(),
                          )),
                      leadingicon: Icons.shopping_cart,
                      text: "Orders"),
                  divider,
                  SettingsTile(
                    leadingicon: Icons.forum,
                    text: "Chat",
                    ontapfunction: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (ChatScreen()),
                          ));
                    },
                  ),
                  divider,
                  SettingsTile(
                      ontapfunction: () {},
                      leadingicon: Icons.local_offer_outlined,
                      text: "Offers & promo"),
                  divider,
                  const SettingsTile(
                      leadingicon: Icons.policy, text: "Privacy Policy"),
                ],
              ),
            ),
            const Spacer(),
            Text(
              "Made with ❤️ by Sufiyan",
              style: TextStyle(fontFamily: fontBook, color: Colors.grey),
            ),
            khight10
          ],
        ),
      ),
    );
  }
}
