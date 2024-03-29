import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/services.dart'; // Used for locking rotation example

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
  brightness: Brightness.dark
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((value) {// This is wrapped by SystemChrome to lock orientation. This is only an example
    runApp(
      MaterialApp(
        themeMode: ThemeMode.light, // could be system to use dark mode when device is using dark mode (my laptop and phone are always dark mode)
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorScheme,
          cardTheme: CardTheme().copyWith(
            elevation: 16,
            color: kDarkColorScheme.secondaryContainer,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorScheme.primaryContainer,
              elevation: 8,
              foregroundColor: kDarkColorScheme.onPrimaryContainer
            )
          ),
        ),
        
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
  // });
  
}