import 'dart:developer';

import 'dart:ui' as ui;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/user_modal.dart';
import 'package:food_deliever_app/presentation/Signup/signup_notification.dart';
import 'package:food_deliever_app/presentation/widget/loginpagetitle.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

final demoimagepath = "Asset/profile/location.png";

class SetLocationScreen extends StatefulWidget {
  SetLocationScreen(
      {super.key,
      this.firstname,
      this.lastname,
      this.mobilenumber,
      this.profileImageurl}) {
    _doucumentReferance =
        FirebaseFirestore.instance.collection("user").doc(currentUser.email);
    _refferancecolloction = _doucumentReferance.collection("UserDetails");
  }
  String? firstname;
  String? lastname;
  String? mobilenumber;
  String? profileImageurl;
  late DocumentReference _doucumentReferance;

  late CollectionReference _refferancecolloction;
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  String? location;
  String? address;
  bool adressfounded = false;

//modal class

  //google map and geolocator
  late GoogleMapController googleMapController;

  CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(9.9312, 76.2673),
    zoom: 10,
  );

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              const LoginpageTitle(
                  appbartitle1: "Set Your", appbartitle2: "Location"),
              khight20,
              khight20,
              Container(
                width: mwidth - 10,
                height: mwidth / 2 - 40,
                decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 20,
                        child: Icon(
                          Icons.location_on,
                          size: 30,
                          color: Colors.orange,
                        ),
                      ),
                      title: (adressfounded)
                          ? Text(address!)
                          : Text(
                              "Your Location",
                              style: TextStyle(fontFamily: fontBold),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: GestureDetector(
                        onTap: () async {
                          Position position = await determinePOsition();

                          getuserAddress(position);
                          googleMapController.animateCamera(
                              CameraUpdate.newCameraPosition(CameraPosition(
                                  target: LatLng(
                                      position.latitude, position.longitude),
                                  tilt: 10,
                                  bearing: 10,
                                  zoom: 16)));
                          final Uint8List markIcons = await getImages(
                              "Asset/profile/location-removebg-preview.png",
                              120);
                          markers.clear();
                          markers.add(Marker(
                              markerId: MarkerId("your Current location"),
                              icon: BitmapDescriptor.fromBytes(markIcons,
                                  size: Size.fromRadius(10)),
                              position: LatLng(
                                  position.latitude, position.longitude)));
                          setState(() {});
                        },
                        child: Container(
                          width: mwidth - 30,
                          height: mwidth / 4 - 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade600,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Text("set"), Text("Location")],
                          ),
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   height: 0.5,
                    // )
                  ],
                ),
              ),
              // SizedBox(
              //   width: double.infinity,
              //   height: 200,
              // )
              Spacer(),
              SizedBox(
                width: mwidth * 0.95,
                height: mwidth * 0.70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GoogleMap(
                    initialCameraPosition: initialCameraPosition,
                    markers: markers,
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    onMapCreated: (GoogleMapController controller) {
                      googleMapController = controller;
                    },
                  ),
                ),
              ),
              Spacer(),
              CutomMaterialButton(
                  onpressed: () async {
                    final usermodal = UserModal(
                        firstname: widget.firstname ?? "User",
                        lastname: widget.lastname ?? " ",
                        mobilenumber: widget.mobilenumber ?? "",
                        imageurl: widget.profileImageurl ?? " ",
                        location: address ?? " ");

                    showDialog(
                      context: context,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                    await widget._refferancecolloction.add(usermodal.tojson());

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              (const SignUpSucessNotification()),
                        ));
                  },
                  text: "Next",
                  width: mwidth / 2),
            ],
          ),
        ),
      ),
    );
  }

  Future<Position> determinePOsition() async {
    bool seaviceEnebled;
    LocationPermission permission;
    seaviceEnebled = await Geolocator.isLocationServiceEnabled();

    if (!seaviceEnebled) {
      await Geolocator.openLocationSettings();
      return Future.error("Location service as desabled");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission == await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permition denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permistion are permenettly denied");
    }
    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  //get user adreess using geocooder

  getuserAddress(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    adressfounded = true;
    setState(() {});
    address =
        "${place.name},${place.street},PIN:${place.postalCode},${place.subLocality},${place.locality},${place.country}";
    log(place.toString());
  }
  //google marker image change

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
