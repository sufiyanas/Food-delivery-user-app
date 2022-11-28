import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/widget/custom_app_bar.dart';
import 'package:food_deliever_app/presentation/widget/cutom_back_icon.dart';

class LoginpageTitle extends StatelessWidget {
  const LoginpageTitle({
    Key? key,
    required this.appbartitle1,
    required this.appbartitle2,
  }) : super(key: key);
  final String appbartitle1;
  final String appbartitle2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomBackIcon(),
        ),
        khight10,
        CustomAppBar(textone: appbartitle1, texttwo: appbartitle2),
        khight10,
        Text("This data will be displayed in your account",
            style: TextStyle(fontFamily: fontBook, fontSize: 15)),
        khight10,
        Text("profile for security",
            style: TextStyle(fontFamily: fontBook, fontSize: 15))
      ],
    );
  }
}
