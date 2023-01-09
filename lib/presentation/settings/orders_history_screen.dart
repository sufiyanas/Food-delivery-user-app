import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/dbFunctions/order_function.dart';
import 'package:food_deliever_app/presentation/Home/widgets/listtilecard_widget.dart';
import 'package:food_deliever_app/presentation/settings/active_screen.dart';
import 'package:food_deliever_app/presentation/settings/compleated_screen.dart';
import 'package:food_deliever_app/presentation/settings/on_prosses_screen.dart';
import 'package:food_deliever_app/presentation/settings/widgets/custom_tile.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
          bottom: const TabBar(indicatorColor: Colors.green, tabs: [
            Tab(
              text: "On Proccess",
            ),
            Tab(
              text: "Active",
            ),
            Tab(
              text: "Compleated",
            )
          ]),
        ),
        body: TabBarView(children: [
          const OnProssesScreen(),
          ActiveScrreen(),
          CompleateScreen(),
        ]),
      ),
    );
  }
}
