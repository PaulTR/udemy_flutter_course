import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        //scaffoldBackgroundColor: Color.fromARGB(255, 225, 149, 255)
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          elevation: 16,
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            elevation: 8,
          )
        ),
        
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold, 
              color: kColorScheme.onSecondaryContainer, 
              fontSize: 14
            )
          )
      ),
      home: Expenses(),
      debugShowCheckedModeBanner: false,
    ),
  );
}