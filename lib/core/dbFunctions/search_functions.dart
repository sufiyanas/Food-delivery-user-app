import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';

class SearchClass {
  static Future<List<FoodModal>> initialList() async {
    final allFoods = FirebaseFirestore.instance
        .collection("food")
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((doc) => FoodModal.fromJson(doc.data()))
            .toList());
    List<FoodModal> initialList = [];
    allFoods.listen((event) {
      for (var food in event) {
        initialList.add(food);
      }
    });
    return initialList;
  }

  //search
  static Future<List<FoodModal>> foodSearch(
      {required String searchVale}) async {
    final allFoods = FirebaseFirestore.instance
        .collection("food")
        .snapshots()
        .map((snapShot) => snapShot.docs
            .map((doc) => FoodModal.fromJson(doc.data()))
            .toList());
    List<FoodModal> serachedList = [];
    allFoods.listen((event) {
      for (var food in event) {
        if (food.dishname.toString().startsWith(searchVale.toUpperCase())) {
          serachedList.add(food);
        }
      }
    });
    return serachedList;
  }
}
