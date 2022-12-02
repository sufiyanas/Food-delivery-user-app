import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/widget/cutom_back_icon.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomBackIcon(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              "Notification",
              style: TextStyle(fontSize: 27, fontFamily: fontBold),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              NotificationCard(
                mwidth: mwidth,
                imageUrl: "Asset/Notification/success.png",
                tileText: "Your order has been taken by the driver",
                time: "Recently",
              ),
              NotificationCard(
                mwidth: mwidth,
                imageUrl: "Asset/Notification/cancelled.png",
                tileText: "Your order has been cancelled",
                time: "22 Junu 2021",
              ),
            ],
          ))
        ]),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    Key? key,
    required this.mwidth,
    required this.imageUrl,
    required this.tileText,
    required this.time,
  }) : super(key: key);

  final double mwidth;
  final String imageUrl;
  final String tileText;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: mwidth / 3,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.contain,
                width: 60,
                height: 60,
              ),
            ),
            SizedBox(
              width: mwidth / 2 + 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tileText,
                    style: TextStyle(fontFamily: fontBold, fontSize: 18),
                  ),
                  khight10,
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
