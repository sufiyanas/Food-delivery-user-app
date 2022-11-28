import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class CustumTextField extends StatelessWidget {
  const CustumTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textfieldwidget(
                labeltext: "Fullname",
                prefixicon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: kthemeGreen,
                    )))),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textfieldwidget(
                labeltext: "Emil",
                prefixicon: Icon(
                  Icons.mail,
                  color: kthemeGreen,
                ))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Textfieldwidget(
            prefixicon: Icon(
              Icons.lock,
              color: kthemeGreen,
            ),
            labeltext: "Password",
            suffixicon:
                IconButton(onPressed: () {}, icon: Icon(Icons.visibility)),
          ),
        ),
      ],
    );
  }
}
