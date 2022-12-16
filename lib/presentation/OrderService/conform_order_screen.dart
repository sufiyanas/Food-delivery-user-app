import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/widget/cutom_back_icon.dart';

class ConformOrderScreen extends StatelessWidget {
  const ConformOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackIcon(),
          Text(
            "Conform Order",
            style: TextStyle(fontFamily: fontBold, fontSize: 25),
          ),
          Container(
            width: mwidth - 20,
            height: mwidth / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade800),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Delever To",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(onPressed: () {}, child: const Text("Edit"))
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor:
                              Colors.orange.shade600.withOpacity(0.5),
                          radius: 20,
                          child: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.orange,
                          )),
                      kwidth10,
                      SizedBox(
                          width: mwidth / 2,
                          child: Text(
                            "4571 Washington Ave. Manchester,Kentucky 39495",
                            style: TextStyle(
                                fontFamily: fontBold,
                                fontSize: 15,
                                wordSpacing: 5,
                                letterSpacing: 0.5),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
