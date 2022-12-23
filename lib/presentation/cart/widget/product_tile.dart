import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';

class CartProductTile extends StatelessWidget {
  CartProductTile({
    Key? key,
    required this.user,
    required this.mwidth,
    // required this.imageUrl,
    // required this.name,
    // required this.status,
  }) : super(key: key);

  final double mwidth;
  // final String imageUrl;
  // final String name;
  // final String status;
  User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: 100,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          user.imageURL,
                        ))),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.dishname,
                style: TextStyle(fontFamily: fontBold, fontSize: 17),
              ),
              Text(
                "available",
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const Spacer(),
          const CustomItomCounter(),
          kwidth10
        ],
      ),
    );
  }
}

class CustomItomCounter extends StatelessWidget {
  const CustomItomCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.green.shade600.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "--",
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
        kwidth5,
        const Text("1"),
        kwidth5,
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.green.shade600,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: IconButton(
                  onPressed: () {},
                  icon: const Text(
                    "+",
                    style: TextStyle(fontSize: 15),
                  ))),
        )
      ],
    );
  }
}
