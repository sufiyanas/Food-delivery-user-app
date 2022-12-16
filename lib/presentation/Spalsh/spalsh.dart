import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_deliever_app/presentation/Spalsh/introscreen/intoscreen_one.dart';

class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});
  Future<void> gotoHomescreen(BuildContext ctx) async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
        ctx, MaterialPageRoute(builder: (ctx) => const IntroScreenOne()));
  }

  @override
  Widget build(BuildContext context) {
    //navigate nxtscreen
    // initstatefunction(){
    //   Timer(Duration(seconds: 2),  Navigator.pushReplacement(context, MaterialPageRoute(
    //     builder: (context) => IntroScreenOne())));
    // }
    gotoHomescreen(context);
    final mheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Container(
            height: mheight,
            width: mheight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Asset/Splash/backgroundimageGreeen.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Image.asset("Asset/Splash/Logo.png"),
          )
          // Center(
          //   child: Image.asset("Asset/Splash/Logo.png"),
          // ),
        ]));
  }
}
