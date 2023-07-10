import 'package:flutter/material.dart';
import 'package:taskyy/pages/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  final MaterialColor customColor = const MaterialColor(0xFF42A5F5, {
    50: Color.fromRGBO(66, 165, 245, .1),
    100: Color.fromRGBO(66, 165, 245, .2),
    200: Color.fromRGBO(66, 165, 245, .3),
    300: Color.fromRGBO(66, 165, 245, .4),
    400: Color.fromRGBO(66, 165, 245, .5),
    500: Color.fromRGBO(66, 165, 245, .6),
    600: Color.fromRGBO(66, 165, 245, .7),
    700: Color.fromRGBO(66, 165, 245, .8),
    800: Color.fromRGBO(66, 165, 245, .9),
    900: Color.fromRGBO(66, 165, 245, 1),
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskyy',
      theme: ThemeData(primarySwatch: customColor),
      home: const Home(),
    );
  }
}
