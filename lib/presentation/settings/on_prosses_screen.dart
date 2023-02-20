import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:food_deliever_app/core/dbFunctions/order_history.dart';

import 'package:food_deliever_app/infrasrructure/order_modal.dart';
import 'package:food_deliever_app/presentation/settings/widgets/custom_tile.dart';

class OnProssesScreen extends StatelessWidget {
  const OnProssesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cureentUserEmail = FirebaseAuth.instance.currentUser!.email;
    return SizedBox(
      child: StreamBuilder(
          stream: getOrderStream(userEmail: cureentUserEmail!),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (snapshot.hasData) {
              final alldDataList = snapshot.data!;
              final List<OrderModal> onProssesList = [];

              if (alldDataList.isEmpty) {
                Text("NO Order is Found");
              }
              for (var order in alldDataList) {
                if (order.userEmail == cureentUserEmail) {
                  final List<OrderModal> curentUserOrder = [];
                  curentUserOrder.add(order);
                  for (var order in curentUserOrder) {
                    if (order.trackOrder == 0) {
                      onProssesList.add(order);
                    }
                  }
                }
              }

              return (onProssesList.isEmpty)
                  ? Center(
                      child: Text("No Active order Founded"),
                    )
                  : ListView.builder(
                      itemCount: onProssesList.length,
                      itemBuilder: (context, index) {
                        return ListtileCardwidget(
                          orderModal: onProssesList[index],
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
