import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';

Future addToFavorate(
    {required String userEmail, required FoodModal foodModal}) async {
  final favoratereff = FirebaseFirestore.instance
      .collection("user")
      .doc(userEmail)
      .collection("Favourite")
      .doc(foodModal.dishname + foodModal.hotalEmail);

  final json = foodModal.toJson();

  await favoratereff.set(json);
}

Future removeFromFavorate(
    {required String userEmail, required FoodModal foodModal}) async {
  final favoratereff = FirebaseFirestore.instance
      .collection("user")
      .doc(userEmail)
      .collection("Favourite")
      .doc(foodModal.dishname + foodModal.hotalEmail);
  await favoratereff.delete();
}

Stream<List<FoodModal>> getStreamFavorate({required String userEmail}) {
  return FirebaseFirestore.instance
      .collection("user")
      .doc(userEmail)
      .collection("Favourite")
      .snapshots()
      .map((snapshots) => snapshots.docs
          .map((docs) => FoodModal.fromJson(docs.data()))
          .toList());
}
