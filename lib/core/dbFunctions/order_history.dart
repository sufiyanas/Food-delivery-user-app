import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_deliever_app/infrasrructure/order_modal.dart';

Stream<List<OrderModal>> getOrderStream({required String userEmail}) {
  return FirebaseFirestore.instance.collection("Orders").snapshots().map(
      (snapshot) =>
          snapshot.docs.map((doc) => OrderModal.fromJson(doc.data())).toList());
}
