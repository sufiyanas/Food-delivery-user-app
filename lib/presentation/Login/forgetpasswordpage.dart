import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/utils.dart';
import 'package:food_deliever_app/presentation/widget/bigtext.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class ForgetpasswordScreen extends StatelessWidget {
  ForgetpasswordScreen({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigTextWithBold(
                    text: "Receive an email to reset your password."),
                khight20,
                Textfieldwidget(
                    labeltext: "email",
                    prefixicon: Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                    onchnaged: (p0) {},
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? "Enter a valid EmailAdrees"
                            : null,
                    controller: emailcontroller),
                khight20,
                CutomMaterialButton(
                    onpressed: () {
                      resetPassword(context);
                    },
                    text: "Reset Password",
                    width: mwidth / 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailcontroller.text.trim(),
      );
      log("password send to the user ");
      Utils.customSnackbar(
          context: context,
          text: "Verification mail send the Email address",
          type: AnimatedSnackBarType.success);
      Navigator.pop(context);

      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => Mainpage(),
      //     ));
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      Utils.customSnackbar(
          context: context,
          text: e.message.toString(),
          type: AnimatedSnackBarType.error);
      //   SnackBar(
      //     backgroundColor: Colors.red,
      //     content: Text(e.message.toString()),
      //   );
      // }
    }
  }
}
