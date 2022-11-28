import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/const.dart';
import 'package:food_deliever_app/presentation/Home/home.dart';
import 'package:food_deliever_app/presentation/widget/textformfield_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mheight = MediaQuery.of(context).size.height;
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textfieldwidget(
              labeltext: "Email",
              prefixicon: Icon(
                Icons.mail,
                color: kthemeGreen,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Textfieldwidget(
              labeltext: "Password",
              prefixicon: Icon(
                Icons.lock,
                color: kthemeGreen,
              ),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Forget your Password?",
                style: TextStyle(color: kthemeGreen),
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (const HomeScreen()),
                    ));
              },
              child: Text("LogIn"))
        ],
      ),
    );
  }
}
