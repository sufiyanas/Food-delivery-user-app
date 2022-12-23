import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/utils.dart';
import 'package:food_deliever_app/main.dart';
import 'package:food_deliever_app/presentation/Login/login.dart';
import 'package:food_deliever_app/presentation/Signup/signup_process.dart';
import 'package:food_deliever_app/presentation/Signup/widget/custumtextfield.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class SignUpScreeen extends StatefulWidget {
  SignUpScreeen({super.key});

  @override
  State<SignUpScreeen> createState() => _SignUpScreeenState();
}

class _SignUpScreeenState extends State<SignUpScreeen> {
  final formkey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  final confrompasswordController = TextEditingController();

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
            // CustumTextField(),
            Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textfieldwidget(
                      controller: emailcontroller,
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? "Enter a valid EmailAdrees"
                              : null,
                      onchnaged: (value) {},
                      labeltext: "Email",
                      prefixicon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: kthemeGreen,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textfieldwidget(
                      controller: passwordcontroller,
                      onchnaged: (p0) {},
                      labeltext: "Password",
                      obscuseText: true,
                      prefixicon: Icon(
                        Icons.mail,
                        color: kthemeGreen,
                      ),
                      suffixicon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.visibility)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Textfieldwidget(
                      controller: confrompasswordController,
                      onchnaged: (p0) {},
                      prefixicon: Icon(
                        Icons.lock,
                        color: kthemeGreen,
                      ),
                      labeltext: "Confirm Password",
                      obscuseText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => (value != null && value.length < 6)
                          ? "Enter min 6 password"
                          : null,
                      suffixicon: IconButton(
                          onPressed: () {}, icon: const Icon(Icons.visibility)),
                    ),
                  ),
                ],
              ),
            ),
            khight10,
            Text(
              "Or Continue with",
              style: TextStyle(fontFamily: fontBold),
            ),
            khight10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                    onpressed: () => sighnup(context),
                    // onpressed: () async {

                    //   //     ));
                    //   // try {
                    //   //   FirebaseAuth.instance.createUserWithEmailAndPassword(
                    //   //       email: emailcontroller.text.trim(),
                    //   //       password: confrompasswordController.text.trim());
                    //   // } on FirebaseAuthException catch (e) {
                    //   //   print(e);
                    //   // }
                    // },
                    text: "Create Account",
                    width: mwidth / 2),
              ],
            ),
            khight20,
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

  Future sighnup(BuildContext context) async {
    final isValid = formkey.currentState!.validate();

    if (!isValid) return;

    // showDialog(
    //   context: context,
    //   builder: (context) => Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: confrompasswordController.text.trim());

      Utils.customSnackbar(
          context: context,
          text: "Sussesfully created an account ",
          type: AnimatedSnackBarType.success);
      setState(() {});
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Mainpage2(),
          ));
    } on FirebaseAuthException catch (e) {
      // print(e);
      log(e.toString());
      log(e.message.toString());
      Utils.customSnackbar(
          context: context,
          text: e.message.toString(),
          type: AnimatedSnackBarType.error);
      // Utils.showSnackBar(e.message);
    }
  }
}
