import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';

Stream<List<FoodModal>> fetchFoodfromcart(String userEmail) => FirebaseFirestore
    .instance
    .collection('Restaurent')
    .doc(userEmail)
    .collection('cart')
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => FoodModal.fromJson(doc.data())).toList());

// Stream<List<String>> fetchRestarentEmail() {
//   return FirebaseFirestore.instance
//       .collection("Restaurent")
//       .snapshots()
//       .map((snapShot) => snapShot.docs.map((docs) => docs.data()).toList());
// }

// getMarker() async {
//   final snapshot =
//       await FirebaseFirestore.instance.collection('Restaurent').get();
//   final temp = snapshot.docs.map((doc) => doc.data());
//   log(temp.toString());
//   return temp;
// }

// getId() async {
//   final firestore = FirebaseFirestore.instance;
// // Get a reference to the collection
//   final collectionReference = firestore.collection('Restaurent');
// // Retrieve the documents in the collection
//   final documents = await collectionReference.get();
// // Extract the IDs from the documents
//   final documentIDs = documents.docs.map((document) => document.id).toList();
//   log('kkkkkk' + documentIDs.toString());
// }

Future<List<String>> setAllDocumentInsideCategories() async {
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
