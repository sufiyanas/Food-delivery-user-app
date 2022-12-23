import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_deliever_app/core/theme/custom_theme.dart';
import 'package:food_deliever_app/presentation/Signup/signup_process.dart';
import 'package:food_deliever_app/presentation/Spalsh/introscreen/intoscreen_one.dart';
import 'package:food_deliever_app/presentation/Spalsh/spalsh.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_deliever_app/presentation/mainscreen/mainscreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorkey = GlobalKey<NavigatorState>();
    return MaterialApp(
        // scaffoldMessengerKey: Utils.messagerkey,
        navigatorKey: navigatorkey,
        theme: MyTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        darkTheme: MyTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: Mainpage()
        // home: LoginScreen(),
        );
  }
}

class Mainpage extends StatelessWidget {
  const Mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(child: Text("Something went Wrong!"));
            } else if (snapshot.hasData) {
              return const MianScreen();
            } else {
              return const IntroScreenOne();
            }
          }),
    );
  }
}

class Mainpage2 extends StatelessWidget {
  const Mainpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.userChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Center(child: Text("Something went Wrong!"));
            } else if (snapshot.hasData) {
              return const SignUpProcessScreen();
            } else {
              return const SignUpProcessScreen();
            }
          }),
    );
  }
}
