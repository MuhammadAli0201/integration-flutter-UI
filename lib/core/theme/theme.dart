import 'package:flutter/material.dart';
ThemeData lightThemeData=ThemeData(
  scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
  primarySwatch: Colors.green,
  fontFamily: "Oxygen",
  primaryColor: Colors.black,
  secondaryHeaderColor: Colors.white,
  cardColor: Colors.white,
  canvasColor: Colors.white
); 

ThemeData darkThemeData=ThemeData(
  primarySwatch: Colors.green,
  appBarTheme: AppBarTheme(color: Colors.black54),
  fontFamily: "Oxygen",
  scaffoldBackgroundColor:Color.fromARGB(255, 30, 30, 30),
  primaryColor: Colors.white,
  secondaryHeaderColor: Color.fromARGB(255, 57, 57, 58),
  cardColor: Color.fromARGB(255, 82, 82, 82),
  canvasColor: Colors.black
);


