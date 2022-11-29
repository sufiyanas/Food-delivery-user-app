import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Signup/setuplocation.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';

class UploadPhotoScreen extends StatelessWidget {
  const UploadPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    final mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LoginpageTitle(
                appbartitle1: "Upload Your Photo ", appbartitle2: "Profile"),
            containerfunction(
                mwidth: mwidth,
                imagetext: "From Gallary",
                imageurl: "Asset/signup/Galleryicon.png"),
            khight10,
            containerfunction(
                mwidth: mwidth,
                imagetext: "Take Photo",
                imageurl: "Asset/signup/camera.png"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (SetLocationScreen()),
                      ));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }

  Container containerfunction(
      {required mwidth, required imageurl, required imagetext}) {
    return Container(
      width: mwidth - 50,
      height: mwidth / 2,
      decoration: BoxDecoration(
          color: kthemeGreen, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageurl),
          khight10,
          Text(
            imagetext,
            style: TextStyle(fontFamily: fontBold),
          )
        ],
      ),
    );
  }
}
