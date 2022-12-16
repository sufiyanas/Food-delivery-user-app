import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Signup/signup.dart';
import 'package:food_deliever_app/presentation/Spalsh/introscreen/widgets/textwidget.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';

class IntroScreentwo extends StatelessWidget {
  const IntroScreentwo({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("Asset/IntoScreenone/intropictwo.png"),
          CustumTextstyleWidget(
            titletext1: "Food Ninja is Where your",
            titletext2: "Comfort food Lives",
            subtext1: "enjoy a fast and smooth food delivery at ",
            subtext2: "your doorsteo",
          ),
          CutomMaterialButton(
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (SignUpScreeen()),
                    ));
              },
              text: "Next",
              width: mwidth / 2)
        ],
      ),
    );
  }
}
