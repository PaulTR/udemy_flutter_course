import 'package:flutter/material.dart';
import 'package:my_app/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final Color startColor;
  final Color endColor;

  GradientContainer(this.startColor, this.endColor, {super.key}) {
    // Initialization work
  }

  @override
  Widget build(context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: startAlignment,
            end: endAlignment,
            colors: [startColor, endColor],
          ),
        ),
        child: Center(
          child: DiceRoller(),
        ));
  }
}
