import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});

  
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

final Random randomizer = Random();

class _DiceRollerState extends State<DiceRoller> {

  var diceNum = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              getName(),
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(8),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28),
              ),
              child: const Text("Roll dice"),
            )
          ],
        );
  }

  void rollDice() {
    setState(() {
      diceNum = randomizer.nextInt(6)+1;
    });
  }

  String getName() {
    return "assets/images/dice-$diceNum.png";
  }

}