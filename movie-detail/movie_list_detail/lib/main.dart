import 'package:flutter/material.dart';
import 'package:movie_list_detail/MovieList.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }
}
