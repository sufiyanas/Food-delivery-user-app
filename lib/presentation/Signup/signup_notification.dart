import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Home/home.dart';
import 'package:food_deliever_app/presentation/mainscreen/mainscreen.dart';

class SignUpSucessNotification extends StatelessWidget {
  const SignUpSucessNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Congrars !"),
            Text("Your profile is Reate"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (MianScreen()),
                      ));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
