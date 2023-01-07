import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/OrderService/conform_order_screen.dart';

class PlaceOrderCard extends StatelessWidget {
  PlaceOrderCard(
      {Key? key,
      required this.mwidth,
      required this.totoalCount,
      required this.priceList,
      required this.navigateFunction})
      : super(key: key);
  final int totoalCount;
  final double mwidth;
  final List<String> priceList;
  int subtotalPrice = 0;
  int delearycahrge = 10;
  int discount = 5;
  Function() navigateFunction;

  @override
  Widget build(BuildContext context) {
    for (var price in priceList) {
      subtotalPrice = subtotalPrice + int.parse(price);
    }
    int total = (subtotalPrice + delearycahrge) - discount;

    return Container(
      width: mwidth - 20,
      height: mwidth / 2,
      decoration: BoxDecoration(
        color: Colors.green.shade400,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
            image: AssetImage("Asset/Splash/Screenbackgroundimage.png"),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              children: [
                CartChargeRow(
                    priceinfotext: "Sub-total",
                    price: subtotalPrice.toString()),
                khight10,
                CartChargeRow(
                    priceinfotext: "Delivary Charge",
                    price: delearycahrge.toString()),
                khight10,
                CartChargeRow(
                    priceinfotext: "Discount", price: discount.toString()),
                khight10,
              ],
            ),
            const Spacer(),
            CartChargeTotalRow(priceinfotext: "Total", price: total.toString()),
            const Spacer(),
            MaterialButton(
              height: 50,
              onPressed: navigateFunction,
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
