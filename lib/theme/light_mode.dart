import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.grey.shade400,
    inversePrimary: Colors.grey.shade800
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey[800],
    displayColor: Colors.black
  ),
  
  // inputDecorationTheme: InputDecorationTheme(
  //   border: OutlineInputBorder(
  //     borderSide: BorderSide(
  //     color: Colors.grey.shade800,
  //     ),
  //   ),

  //   focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(12),
  //           borderSide: BorderSide(
  //             color: Colors.green,
  //             width: 2.0,
  //           ),
  //   ),
  // )

);

