import 'package:flutter/material.dart';
import 'package:taskyy/models/task.dart';
import 'package:taskyy/pages/home.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskyy/models/boxes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  boxTasks = await Hive.openBox('tasksBox');
  runApp(const MainApp());
}

MaterialColor customColor = const MaterialColor(0xFF42A5F5, {
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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskyy',
      theme: ThemeData(
          primarySwatch: customColor,
          iconTheme: IconThemeData(
            color: customColor[500],
          )),
      home: const Home(),
    );
  }
}
