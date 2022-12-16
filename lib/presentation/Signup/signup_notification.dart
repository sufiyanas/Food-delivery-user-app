import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Home/home.dart';
import 'package:food_deliever_app/presentation/mainscreen/mainscreen.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';
import 'package:lottie/lottie.dart';

class SignUpSucessNotification extends StatelessWidget {
  const SignUpSucessNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    final mhight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(
                  height: mwidth / 2,
                ),
                LottieBuilder.network(
                  "https://assets7.lottiefiles.com/packages/lf20_fNYBBByMRa.json",
                  repeat: false,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
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
                  "Your Profile Is Ready To Use",
                  style: TextStyle(
                    fontFamily: fontBold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => (MianScreen()),
            //           ));
            //     },
            //     child: Text("Next"))
            Spacer(
              flex: 3,
            ),
            CutomMaterialButton(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (const MianScreen()),
                      ));
                },
                text: "Try Order",
                width: mwidth / 2),
            Spacer()
          ],
        ),
      ),
    );
  }
}
