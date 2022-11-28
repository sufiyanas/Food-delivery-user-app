import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/widget/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            CustomAppBar(
              textone: "Find Your",
              texttwo: "Favorate Food",
              actionButton: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: kthemeGrey, borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: kthemeGreen,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
