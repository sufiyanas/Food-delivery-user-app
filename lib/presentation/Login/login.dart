import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/utils.dart';
import 'package:food_deliever_app/main.dart';
import 'package:food_deliever_app/presentation/Home/home.dart';
import 'package:food_deliever_app/presentation/Login/forgetpasswordpage.dart';
import 'package:food_deliever_app/presentation/Spalsh/introscreen/intoscreen_one.dart';
import 'package:food_deliever_app/presentation/mainscreen/mainscreen.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  String? password;
  String? email;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                height: mwidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('Asset/Splash/Logo.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textfieldwidget(
                  validator: (text) =>
                      text != null && !EmailValidator.validate(text)
                          ? "Enter a vaild email"
                          : null,
                  controller: emailController,
                  onchnaged: (value) {
                    email = value;
                    log(email.toString());
                  },
                  labeltext: "Email",
                  prefixicon: Icon(
                    Icons.mail,
                    color: kthemeGreen,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Textfieldwidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter any password";
                    } else if (value.length < 6) {
                      return "Min 6 digits";
                    }
                    return null;
                  },
                  controller: passController,
                  onchnaged: (value) {
                    password = value;
                    log(password.toString());
                  },
                  labeltext: "Password",
                  prefixicon: Icon(
                    Icons.lock,
                    color: kthemeGreen,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // log("The email is $email and password is $password");\
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetpasswordScreen(),
                      ));
                },
                child: Text(
                  "Forget your Password?",
                  style: TextStyle(color: kthemeGreen),
                ),
              ),
              ElevatedButton(
                onPressed: () => login(context),
                child: const Text("LogIn"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future login(BuildContext context) async {
    final isvalid = formkey.currentState!.validate();
    if (!isvalid) {
      return;
    }

    try {
      log("The email is $email and password is $password");
      // showDialog(
      //   context: context,
      //   builder: (context) => const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // );
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text.trim());

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Mainpage(),
          ));
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      Utils.customSnackbar(
          context: context,
          text: e.message.toString(),
          type: AnimatedSnackBarType.error,
          mobileSnackBarPosition: MobileSnackBarPosition.top);
    }
  }
}
