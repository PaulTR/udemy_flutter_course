import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.purpleAccent,
        side: BorderSide(color: Colors.white, width: 1),
      ),
      icon: Icon(
        Icons.arrow_right_alt,
        size: 24.0,
      ),
      label: Text('Start Quiz'),
    );
  }
}
