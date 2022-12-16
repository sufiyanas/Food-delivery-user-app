import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Login/login.dart';
import 'package:food_deliever_app/presentation/Signup/signup_process.dart';
import 'package:food_deliever_app/presentation/Signup/widget/custumtextfield.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';

class SignUpScreeen extends StatelessWidget {
  const SignUpScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: mwidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Asset/Splash/Logo.png'),
                ),
              ),
            ),
            Text(
              "Sign Up For Free",
              style: TextStyle(fontFamily: fontBold, fontSize: 20),
            ),
            CustumTextField(),
            Text(
              "Or Continue with",
              style: TextStyle(fontFamily: fontBold),
            ),
            Container(
              height: 64,
              width: 164,
              decoration: BoxDecoration(
                color: kthemeGrey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  kwidth10,
                  SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset("Asset/signup/google.png")),
                  const Text(
                    "Google",
                    style: TextStyle(fontSize: 20),
                  ),
                  kwidth10
                ],
              ),
            ),
            CutomMaterialButton(
                onpressed: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => (const SignUpProcessScreen()),
                  //     ));
                  try {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: "", password: "");
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                },
                text: "Create Account",
                width: mwidth / 2),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (LoginScreen()),
                      ));
                },
                child: Text(
                  "already have an account?",
                  style: TextStyle(color: kthemeGreen),
                )),
          ],
        ),
      ),
    );
  }
}
