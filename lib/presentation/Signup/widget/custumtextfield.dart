import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class CustumTextField extends StatelessWidget {
  final fullname = TextEditingController();
  final passwordcontroller = TextEditingController();
  final emailController = TextEditingController();
  CustumTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Textfieldwidget(
            controller: emailController,
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
                prefixicon: Icon(
                  Icons.mail,
                  color: kthemeGreen,
                ))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Textfieldwidget(
            controller: emailController,
            onchnaged: (p0) {},
            prefixicon: Icon(
              Icons.lock,
              color: kthemeGreen,
            ),
            labeltext: "Confirm Password",
            suffixicon:
                IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
          ),
        ),
      ],
    );
  }
}
