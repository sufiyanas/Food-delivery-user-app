import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Signup/setuplocation.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';

// ignore: must_be_immutable
class SelectedPhotoViewScrreen extends StatelessWidget {
  SelectedPhotoViewScrreen(
      {super.key,
      this.imagepath,
      this.imagename,
      this.firstname,
      this.lastname,
      this.mobilenumber});
  String? imagepath;
  String? imagename;
  String? firstname;
  String? lastname;
  String? mobilenumber;
  UploadTask? uploadTask;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          LoginpageTitle(
              appbartitle1: "Are you Okkay",
              appbartitle2: "With this Profile?"),
          khight20,
          Container(
            width: mwidth * 0.70,
            height: mwidth * 0.70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    image: (imagepath != null)
                        ? FileImage(File(imagepath!))
                        : AssetImage("Asset/profile/profile.png")
                            as ImageProvider)),
          ),
          Spacer(),
          CutomMaterialButton(
              onpressed: () async {
                final imageUrl = await uploadFiletoFirebase(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (SetLocationScreen(
                        firstname: firstname,
                        lastname: lastname,
                        mobilenumber: mobilenumber,
                        profileImageurl: imageUrl ?? "Asset/Splash/Logo.png",
                      )),
                    ));
              },
              text: "Upload Image",
              width: mwidth / 2),
          khight20,
        ],
      ),
    ));
  }

  uploadFiletoFirebase(BuildContext context) async {
    log(imagename.toString());
    log("Upload File Called");
    final path = 'UsersProfile/${user.email}Profile';
    final file = File(imagepath!);
    log(imagepath.toString());
    final ref = FirebaseStorage.instance.ref(path);

    uploadTask = ref.putFile(file);
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    log('Uploaded');
    final sanpshot = await uploadTask!.whenComplete(() {});
    log('After Upload');
    final urlDownload = await sanpshot.ref.getDownloadURL();
    log("Download Link : $urlDownload");

    uploadTask = null;

    return urlDownload;
  }
}
