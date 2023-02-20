import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/core/dbFunctions/cart.dart';
import 'package:food_deliever_app/core/dbFunctions/order_function.dart';
import 'package:food_deliever_app/infrasrructure/cart_modal.dart';
import 'package:food_deliever_app/main.dart';
import 'package:food_deliever_app/presentation/Home/home.dart';

import 'package:food_deliever_app/presentation/cart/widget/place_order_row.dart';
import 'package:food_deliever_app/presentation/widget/cutom_back_icon.dart';
import 'package:food_deliever_app/presentation/widget/mateialbutton_cusamized.dart';
import 'package:food_deliever_app/presentation/widget/succes_notification_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ConformOrderScreen extends StatefulWidget {
  ConformOrderScreen(
      {super.key,
      required this.totoalCount,
      required this.priceList,
      required this.cartList,
      required this.userAddress});
  final int totoalCount;
  final List<String> priceList;
  final List<CartModal> cartList;
  final String userAddress;

  @override
  State<ConformOrderScreen> createState() => _ConformOrderScreenState();
}

class _ConformOrderScreenState extends State<ConformOrderScreen> {
  final _razorpay = Razorpay();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  var options = {
    'key': 'rzp_test_mkzSidhb6RgmDG',
    'amount': 10000,
    'name': 'Food Ninja',
    'description': 'Demo',
    'prefill': {
      'contact': '8156805226',
      'email': 'mohammedSufiyanas123@gmail.com'
    },
    'external': {
      'wallets': ['paytm']
    }
  };

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log("Sussses");
    await placeOrder();

    for (var item in widget.cartList) {
      await deleteCartCount(cartModal: item);
    }

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => SuccessNotificationScreen(
                naviagtorFunction: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        // ignore: prefer_const_constructors
                        builder: (context) => (Mainpage()),
                      ));
                },
                buttontext: "Go to Home",
                succesInformation: "Your order is placed")),
        (route) => true);
    // Navigator.pushReplacement(context, )
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log("Failure");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {}

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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       "Delever To",
                  //       style: TextStyle(color: Colors.grey),
                  //     ),
                  //     TextButton(onPressed: () {}, child: const Text("Edit"))
                  //   ],
                  // ),
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
                          widget.userAddress,
                          style: TextStyle(
                              fontFamily: fontBold,
                              fontSize: 15,
                              wordSpacing: 5,
                              letterSpacing: 0.5),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: PlaceOrderCard(
                navigateFunction: () async {
                  final currentuserEmail =
                      FirebaseAuth.instance.currentUser!.email;
                  _razorpay.open(options);
                  // placeOrder();
                },
                mwidth: mwidth,
                totoalCount: widget.totoalCount,
                priceList: widget.priceList),
          ),
          khight20
        ],
      ),
    ));
  }

  //place order
  placeOrder() {
    final useremail = FirebaseAuth.instance.currentUser!.email;
    for (var order in widget.cartList) {
      addOrdersToFirebase(cartModal: order, userEmail: useremail!);
      log('item added : ${order.dishname}');
    }
  }
}
