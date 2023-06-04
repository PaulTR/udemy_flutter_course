import 'package:flutter/material.dart';
import 'package:my_app/gradient_container.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Test"),
        ),
        body: GradientContainer(
          const Color.fromARGB(255, 140, 10, 183),
          const Color.fromRGBO(142, 107, 4, 1),
        ),
      ),
    ),
  );
}

/*
void add(a, b) {
  print(a + b);
}

void add2({a, b}) {
  print(a + b);
}

void add3({a, b = 5}) {
  print(a + b);
}
*/