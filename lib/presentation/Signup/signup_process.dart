import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Signup/uploadphoto.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class SignUpProcessScreen extends StatelessWidget {
  const SignUpProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginpageTitle(
              appbartitle1: "Fill in your bio to get",
              appbartitle2: "started",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Textfieldwidget(
                  labeltext: "First Name",
                  prefixicon: Icon(
                    Icons.person,
                    color: kthemeGreen,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Textfieldwidget(
                  labeltext: "Last Name",
                  prefixicon: Icon(
                    Icons.person,
                    color: kthemeGreen,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Textfieldwidget(
                  labeltext: "Mobile Number",
                  prefixicon: Icon(
                    Icons.call,
                    color: kthemeGreen,
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (UploadPhotoScreen()),
                      ));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
