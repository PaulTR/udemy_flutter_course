import 'package:flutter/material.dart';
import 'package:tinder_clone/BackgroundCurveWidget.dart';
import 'package:tinder_clone/CardsStackWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            BackgroundCurveWidget(),
            CardsStackWidget(),
          ],
        ),
      ),
    );
  }
}
