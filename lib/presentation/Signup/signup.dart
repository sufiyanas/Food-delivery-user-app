import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Login/login.dart';
import 'package:food_deliever_app/presentation/Signup/signup_process.dart';
import 'package:food_deliever_app/presentation/Signup/widget/custumtextfield.dart';

class SignUpScreeen extends StatelessWidget {
  const SignUpScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final mhight = MediaQuery.of(context).size.height;
    final mwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            height: mwidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('Asset/Splash/Logo.png'),
            )),
          ),
          Text(
            "Sign Up For Free",
            style: TextStyle(fontFamily: fontBold, fontSize: 20),
          ),
          khight10,
          CustumTextField(),
          khight10,
          Text(
            "Or Continue with",
            style: TextStyle(fontFamily: fontBold),
          ),
          Container(
            height: 80,
            width: mwidth / 2,
            decoration: BoxDecoration(
              color: kthemeGrey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                kwidth10,
                SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset("Asset/signup/google.png")),
                Text(
                  "Google",
                  style: TextStyle(fontSize: 20),
                ),
                kwidth10
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (SignUpProcessScreen()),
                    ));
              },
              child: Text("Create Account")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (LoginScreen()),
                    ));
              },
              child: Text(
                "already have an account?",
                style: TextStyle(color: kthemeGreen),
              )),
        ],
      ),
    );
  }
}
