import 'package:flutter/material.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginpageTitle(
                appbartitle1: "Upload Your Photo ", appbartitle2: "Profile"),
            ElevatedButton(onPressed: () {}, child: Text("Next"))
          ],
        ),
      ),
    );
  }
}
