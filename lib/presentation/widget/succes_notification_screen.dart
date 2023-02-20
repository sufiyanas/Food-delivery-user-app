import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';
import 'package:lottie/lottie.dart';

class SuccessNotificationScreen extends StatelessWidget {
  const SuccessNotificationScreen(
      {super.key,
      required this.naviagtorFunction,
      required this.buttontext,
      required this.succesInformation});
  final Function() naviagtorFunction;
  final String buttontext;
  final String succesInformation;
  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: mwidth * 0.20,
                ),
                LottieBuilder.asset(
                  "Asset/sucsees.json",
                  repeat: false,
                ),
                Text(
                  "Congrats !",
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: fontBold,
                    fontSize: 25,
                  ),
                ),
                khight20,
                Text(
                  succesInformation,
                  style: TextStyle(
                    fontFamily: fontBold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 3,
            ),
            CutomMaterialButton(
                onpressed: naviagtorFunction,
                text: buttontext,
                width: mwidth / 2),
            Spacer()
          ],
        ),
      ),
    );
  }
}
