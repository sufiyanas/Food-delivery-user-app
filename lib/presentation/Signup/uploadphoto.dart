import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
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
            containerfunction(mwidth),
            khight10,
            containerfunction(mwidth),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (UploadPhotoScreen()),
                      ));
                },
                child: Text("Next"))
          ],
        ),
      ),
    );
  }

  Container containerfunction(double mwidth) {
    return Container(
      width: mwidth - 50,
      height: mwidth / 2,
      decoration: BoxDecoration(
          color: kthemeGreen, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("Asset/signup/Galleryicon.png"),
          khight10,
          Text(
            "From Gallery",
            style: TextStyle(fontFamily: fontBold),
          )
        ],
      ),
    );
  }
}
