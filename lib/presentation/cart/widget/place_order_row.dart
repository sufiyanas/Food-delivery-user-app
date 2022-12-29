import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/infrasrructure/food_modal.dart';
import 'package:food_deliever_app/presentation/OrderService/conform_order_screen.dart';

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
