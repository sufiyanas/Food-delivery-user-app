import 'package:flutter/material.dart';

import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/OrderService/conform_order_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            khight20,
            khight20,
            Text(
              "Order Details",
              style: TextStyle(fontFamily: fontBold, fontSize: 30),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView(
                    children: [
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                      CartProductTile(
                          mwidth: mwidth,
                          imageUrl: "Asset/Cart/Menu Photo.png",
                          name: "Spizy Fresh Crab",
                          status: "Hotal name"),
                    ],
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: PlaceOrderCard(mwidth: mwidth),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlaceOrderCard extends StatelessWidget {
  const PlaceOrderCard({
    Key? key,
    required this.mwidth,
  }) : super(key: key);

  final double mwidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mwidth - 20,
      height: mwidth / 2,
      decoration: BoxDecoration(
          color: Colors.green.shade400,
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage("Asset/Splash/Screenbackgroundimage.png"),
              fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                const CartChargeRow(priceinfotext: "Sub-total", price: "120"),
                khight10,
                const CartChargeRow(
                    priceinfotext: "Delivary Charge", price: "10"),
                khight10,
                const CartChargeRow(priceinfotext: "Discount", price: "120"),
                khight10,
              ],
            ),
            const Spacer(),
            const CartChargeTotalRow(priceinfotext: "Total", price: "150"),
            const Spacer(),
            MaterialButton(
              height: 50,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (ConformOrderScreen()),
                    ));
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 8,
              minWidth: mwidth,
              child: Text(
                "Place My order",
                style: TextStyle(
                    color: kthemeGreen, fontSize: 15, fontFamily: fontBold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartChargeRow extends StatelessWidget {
  const CartChargeRow({
    Key? key,
    required this.priceinfotext,
    required this.price,
  }) : super(key: key);
  final String priceinfotext;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          priceinfotext,
          style: TextStyle(
            fontFamily: fontBold,
          ),
        ),
        Text("${price}\$", style: TextStyle(fontFamily: fontBold))
      ],
    );
  }
}

class CartChargeTotalRow extends StatelessWidget {
  const CartChargeTotalRow({
    Key? key,
    required this.priceinfotext,
    required this.price,
  }) : super(key: key);
  final String priceinfotext;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          priceinfotext,
          style: TextStyle(fontFamily: fontBold, fontSize: 25),
        ),
        Text("${price}\$", style: TextStyle(fontFamily: fontBold, fontSize: 20))
      ],
    );
  }
}

class CartProductTile extends StatelessWidget {
  const CartProductTile({
    Key? key,
    required this.mwidth,
    required this.imageUrl,
    required this.name,
    required this.status,
  }) : super(key: key);

  final double mwidth;
  final String imageUrl;
  final String name;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: mwidth / 3 - 20,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(imageUrl),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontFamily: fontBold, fontSize: 17),
              ),
              Text(
                status,
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
