import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

// This is our  main focus
// Let's apply light and dark theme on our app
// Now let's add dark theme on our app

final ThemeData lightTheme = ThemeData(
  primaryColor: kPrimaryColor,
  primaryColorDark: const Color(0xFF505050),
  brightness: Brightness.light,
  dividerTheme: const DividerThemeData(
    color: Color(0xFFD9D9D9),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    centerTitle: false,
    elevation: 0,
    iconTheme: IconThemeData(color: kDarkColor),
  ),
  iconTheme: const IconThemeData(color: kDarkColor),
  textTheme: ThemeData.light().textTheme.apply(
        bodyColor: kDarkColor,
        fontFamily: 'Okine',
      ),
  colorScheme: const ColorScheme.light(
    background: kLightBackgroundColor,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    error: kErrorColor,
  ),
  chipTheme: ChipThemeData(
    labelStyle: const TextStyle(
      fontFamily: 'Okine',
      color: kPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    color: const MaterialStatePropertyAll(kPrimarySecondaryColor),
    side: const BorderSide(width: 0, color: kPrimarySecondaryColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: kDarkColor,
      fontFamily: 'Okine',
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    unselectedItemColor: kDarkColor,
    selectedIconTheme: IconThemeData(color: kPrimaryColor),
    unselectedIconTheme: IconThemeData(color: kPrimaryColor),
    showUnselectedLabels: true,
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: kPrimaryColor,
  primaryColorDark: const Color(0xFF505050),
  brightness: Brightness.dark,
  dividerTheme: const DividerThemeData(
    color: Color(0xFFD9D9D9),
  ),
  primaryIconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle:
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
    centerTitle: false,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: ThemeData.dark().textTheme.apply(
        bodyColor: Colors.white,
        fontFamily: 'Okine',
      ),
  colorScheme: const ColorScheme.dark(
    background: kBackgroundColor,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    error: kErrorColor,
  ),
  chipTheme: ChipThemeData(
    labelStyle: const TextStyle(
      fontFamily: 'Okine',
      color: kPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    color: const MaterialStatePropertyAll(kPrimarySecondaryColor),
    side: const BorderSide(width: 0, color: kPrimarySecondaryColor),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'Okine',
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 0,
    unselectedItemColor: kDarkColor,
    selectedIconTheme: IconThemeData(color: kPrimaryColor),
    unselectedIconTheme: IconThemeData(color: kPrimaryColor),
    showUnselectedLabels: true,
  ),
);
