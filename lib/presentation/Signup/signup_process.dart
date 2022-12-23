import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Signup/uploadphoto.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class SignUpProcessScreen extends StatelessWidget {
  const SignUpProcessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firstnamecontroller = TextEditingController();
    final lastnamecontroller = TextEditingController();
    final mobileNumberController = TextEditingController();
    final mwidth = MediaQuery.of(context).size.width;
    late String firstname;
    late String lastname;
    late String mobileNumber;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              LoginpageTitle(
                appbartitle1: "Fill in your bio to get",
                appbartitle2: "started",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textfieldwidget(
                    controller: mobileNumberController,
                    onchnaged: (value) {
                      firstname = value;
                    },
                    labeltext: "First Name",
                    prefixicon: Icon(
                      Icons.person,
                      color: kthemeGreen,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textfieldwidget(
                    controller: lastnamecontroller,
                    onchnaged: (value) {
                      lastname = value;
                    },
                    labeltext: "Last Name",
                    prefixicon: Icon(
                      Icons.person,
                      color: kthemeGreen,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textfieldwidget(
                    controller: mobileNumberController,
                    onchnaged: (value) {
                      mobileNumber = value;
                    },
                    labeltext: "Mobile Number",
                    prefixicon: Icon(
                      Icons.call,
                      color: kthemeGreen,
                    )),
              ),
              Spacer(
                flex: 4,
              ),
              CutomMaterialButton(
                  onpressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (const UploadPhotoScreen()),
                        ));
                    // try {
                    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
                    //       email: firstnamecontroller.text.trim(),
                    //       password: mobileNumberController.text.trim());
                    // } on FirebaseAuthException catch (e) {
                    //   print(e);
                    // }
                  },
                  text: "Create Account",
                  width: mwidth / 2),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
