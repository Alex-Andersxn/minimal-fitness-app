import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.grey[300],
    displayColor: Colors.white
  ),

  // appBarTheme: AppBarTheme(
  //   backgroundColor: Colors.grey.shade900, // AppBar background color
  //   titleTextStyle: TextStyle(
  //     color: Colors.white, // Title text color
  //     fontSize: 20,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   iconTheme: IconThemeData(
  //     color: Colors.white, // Icon color
  //   ),
  // )

);