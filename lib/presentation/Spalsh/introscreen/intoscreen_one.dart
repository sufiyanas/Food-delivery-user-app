import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Spalsh/introscreen/introscreen_two.dart';
import 'package:food_deliever_app/presentation/Spalsh/introscreen/widgets/textwidget.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';

class IntroScreenOne extends StatelessWidget {
  const IntroScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    // final mwidth = mWidthfn(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("Asset/IntoScreenone/Intopicone.png"),
          CustumTextstyleWidget(
            titletext1: "Find your Comfort",
            titletext2: " Food here",
            subtext1: "here you can find a ched or dish for every",
            subtext2: "taste and color.Enjoy!",
          ),
          CutomMaterialButton(
              onpressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (IntroScreentwo()),
                    ));
              },
              text: "Next",
              width: mwidth / 2)
        ],
      ),
    );
  }
}
