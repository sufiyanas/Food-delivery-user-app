import 'package:flutter/material.dart';
import 'package:food_deliever_app/presentation/Spalsh/introscreen/intoscreen_one.dart';
import 'package:food_deliever_app/presentation/Spalsh/spalsh.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'BentonSans'),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: IntroScreenOne(),
    );
  }
}
