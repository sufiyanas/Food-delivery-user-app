import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Chat/chatscreen.dart';

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
                  const SettingsTile(
                      leadingicon: Icons.shopping_cart, text: "Orders"),
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
                  const SettingsTile(
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
            )
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {Key? key,
      required this.text,
      required this.leadingicon,
      this.ontapfunction})
      : super(key: key);
  final String text;
  final IconData leadingicon;
  final Function()? ontapfunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontapfunction,
      child: Row(
        children: [
          Icon(
            leadingicon,
            color: kthemeGreen,
          ),
          kwidth10,
          Text(
            text,
            style: TextStyle(color: Colors.grey.shade100, fontSize: 25),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: kthemeGreen,
          )
        ],
      ),
    );
  }
}
