import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Signup/signup_notification.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginpageTitle(
                appbartitle1: "Set Your Location", appbartitle2: "  "),
            Container(
              width: mwidth - 10,
              height: mwidth / 2 - 20,
              decoration: BoxDecoration(
                  color: kthemeGreen, borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 10,
                    ),
                    title: Text("Your Location"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Container(
                      width: mwidth - 15,
                      height: mwidth / 4 - 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kthemeBlack,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("set"), Text("Location")],
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: 0.5,
                  // )
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (SignUpSucessNotification()),
                      ));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
