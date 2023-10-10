import 'package:flutter/material.dart';
import 'package:navigation_test/my_home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_test/second_page.dart';

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(title: "Test",),
      routes: <RouteBase>[
        GoRoute(
          path: '/details',
          builder: (context, state) => SecondPage(),
        ),
      ],
    ),
    
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
