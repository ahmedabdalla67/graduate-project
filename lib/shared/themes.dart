import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  primarySwatch: Colors.blue,
  fontFamily: 'Baloo2',
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Baloo2'),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    type: BottomNavigationBarType.values.last,
    backgroundColor: Colors.white,
  ),
);
