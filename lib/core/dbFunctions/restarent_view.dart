import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_deliever_app/infrasrructure/restarent_details.dart';

Future<List<String>> getallRestaurent() async {
  List<String> idList = [];
  var collection = FirebaseFirestore.instance.collection('Restaurent');
  var querySnapshots = await collection.get();
  for (var snapshot in querySnapshots.docs) {
    var documentID = snapshot.id; // <-- Document ID
    log(documentID);

    idList.add(documentID);
  }
  return idList;
}

//for getting restarent details

Stream<List<HotalModal>> getRestaurentdetails(
    {required String restarentEmail}) {
  final doucumentReferance = FirebaseFirestore.instance
      .collection("Restaurent")
      .doc(restarentEmail)
      .collection("RestaurentDetails");

  return doucumentReferance.snapshots().map((snapshots) =>
      snapshots.docs.map((doc) => HotalModal.fromJson(doc.data())).toList());
}
