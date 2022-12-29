import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Signup/selected_photo_view_screen.dart';
import 'package:food_deliever_app/presentation/Signup/setuplocation.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhotoScreen extends StatelessWidget {
  UploadPhotoScreen(
      {super.key,
      required this.firstname,
      required this.lastname,
      required this.mobilenumber});
  final String firstname;
  final String lastname;
  final String mobilenumber;
  final ImagePicker picker = ImagePicker();
  String? imagepath;
  String? imagename;
  UploadTask? uploadTask;
//select image from galary
  selectImageGallary() async {
    final XFile? imageGalary =
        await picker.pickImage(source: ImageSource.gallery);
    if (imageGalary == null) {
      return;
    }
    imagepath = imageGalary.path;
    imagename = imageGalary.name;
  }

//select image from cammera
  selectImageCammera() async {
    final XFile? imageCammera =
        await picker.pickImage(source: ImageSource.camera);
    if (imageCammera == null) {
      return;
    }

    imagepath = imageCammera.path;
    imagename = imageCammera.name;
  }

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    // final mheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              LoginpageTitle(
                  appbartitle1: "Upload Your Photo ", appbartitle2: "Profile"),
              Spacer(),
              containerfunction(
                  ontap: () async {
                    await selectImageGallary();
                    if (imagepath == null) {
                      return;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedPhotoViewScrreen(
                            imagepath: imagepath,
                            imagename: imagename,
                            firstname: firstname,
                            lastname: lastname,
                            mobilenumber: mobilenumber,
                          ),
                        ));
                  },
                  mwidth: mwidth,
                  imagetext: "From Gallary",
                  imageurl: "Asset/signup/Galleryicon.png"
                  // imageurl: (imagepath != null)
                  //     ? FileImage(File(imagepath!))
                  //     : AssetImage("Asset/signup/Galleryicon.png")
                  //         as ImageProvider
                  ),
              khight20,
              containerfunction(
                  ontap: () async {
                    await selectImageCammera();
                    if (imagepath == null) {
                      return;
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectedPhotoViewScrreen(
                            imagepath: imagepath,
                            imagename: imagename,
                            firstname: firstname,
                            lastname: lastname,
                            mobilenumber: mobilenumber,
                          ),
                        ));
                  },
                  mwidth: mwidth,
                  imagetext: "Take Photo",
                  imageurl: "Asset/signup/camera.png"),
              Spacer(),
              CutomMaterialButton(
                  onpressed: () async {
                    final imageURL = await uploadFiletoFirebase(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (SetLocationScreen(
                            firstname: firstname,
                            lastname: lastname,
                            mobilenumber: mobilenumber,
                            profileImageurl: imageURL,
                          )),
                        ));
                  },
                  text: "Create Account",
                  width: mwidth / 2),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Widget containerfunction(
      {required mwidth,
      required String imageurl,
      required imagetext,
      required Function() ontap}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: mwidth - 50,
        height: mwidth / 2 - 20,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(15)),
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
      ),
    );
  }

  uploadFiletoFirebase(BuildContext context) async {
    // log(imagename.toString());
    log("Upload File Called");
    const path = 'UsersProfile/Profile/noprofile';
    final file = File("Asset/profile/profile.png");
    // log(imagepath.toString());
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
