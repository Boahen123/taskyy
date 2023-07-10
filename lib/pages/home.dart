import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.maybeOf(context)!.size.height;
    _deviceWidth = MediaQuery.maybeOf(context)!.size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.12,
        title: Center(
          child: Text(
            'Taskyy!',
            style: TextStyle(
              fontSize: _deviceWidth * 0.10,
            ),
          ),
        ),
      ),
    );
  }
}
