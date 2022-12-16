import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/main.dart';
import 'package:food_deliever_app/presentation/Home/home.dart';
import 'package:food_deliever_app/presentation/mainscreen/mainscreen.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  String? password;
  String? email;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a text";
                  }
                  return null;
                },
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
                    return "please enter a text";
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
                log("The email is $email and password is $password");
              },
              child: Text(
                "Forget your Password?",
                style: TextStyle(color: kthemeGreen),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // signIn(
                //     emailController: emailcontroler,
                //     passWordController: passWordController);

                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                try {
                  log("The email is $email and password is $password");
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email!, password: password!);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => (Mainpage()),
                  //     ));
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mainpage(),
                      ));
                } on FirebaseAuthException catch (e) {
                  log(e.toString());
                }
                // Navigator.pop(context);
                // navigatorkey.currentstate!.popUntl((route))=>
              },
              child: const Text("LogIn"),
            )
          ],
        ),
      ),
    );
  }

  // Future signIn({
  //   required TextEditingController emailController,
  //   required TextEditingController passWordController,
  // }) try

  //   async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passWordController.text.trim());

  // }
}
