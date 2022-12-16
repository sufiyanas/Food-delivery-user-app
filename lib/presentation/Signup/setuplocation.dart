import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Signup/signup_notification.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';

class SetLocationScreen extends StatelessWidget {
  const SetLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const LoginpageTitle(
                  appbartitle1: "Set Restaurant ", appbartitle2: "Location"),
              khight20,
              khight20,
              Container(
                width: mwidth - 10,
                height: mwidth / 2 - 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 20,
                        child: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.orange,
                        ),
                      ),
                      title: Text(
                        "Your Location",
                        style: TextStyle(fontFamily: fontBold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Container(
                        width: mwidth - 30,
                        height: mwidth / 4 - 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade600,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [Text("set"), Text("Location")],
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   height: 0.5,
                    // )
                  ],
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              CutomMaterialButton(
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              (const SignUpSucessNotification()),
                        ));
                  },
                  text: "Next",
                  width: mwidth / 2),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
