import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/dbFunctions/order_history.dart';
import 'package:food_deliever_app/infrasrructure/order_modal.dart';
import 'package:food_deliever_app/presentation/settings/widgets/custom_tile.dart';

class CompleateScreen extends StatelessWidget {
  const CompleateScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cureentUserEmail = FirebaseAuth.instance.currentUser!.email;
    return Container(
      child: StreamBuilder(
          stream: getOrderStream(userEmail: cureentUserEmail!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              final alldDataList = snapshot.data!;
              final List<OrderModal> activeList = [];

              if (alldDataList.isEmpty) {
                Text("NO Order is Found");
              }
              for (var order in alldDataList) {
                if (order.userEmail == cureentUserEmail) {
                  final List<OrderModal> curentUserOrder = [];
                  curentUserOrder.add(order);
                  for (var order in curentUserOrder) {
                    if (order.isCompleated == true) {
                      activeList.add(order);
                    }
                  }
                }
              }

              return ListView.builder(
                itemCount: activeList.length,
                itemBuilder: (context, index) {
                  return ListtileCardwidget(
                    orderModal: activeList[index],
                    mwidth: 100,
                    ontap: () {},
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
