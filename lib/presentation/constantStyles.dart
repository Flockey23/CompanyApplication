import 'package:flutter/material.dart';

class ConstantStyles {
  static const TextStyle textFormFieldStyle = TextStyle(fontSize: 16);

  static const TextStyle labelStyle =
      TextStyle(fontSize: 20, color: Colors.white);

  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      shadowColor: Colors.white,
      backgroundColor: Colors.black38,
      minimumSize: const Size(200, 50),
      textStyle: textStyle);

  static const TextStyle textStyle =
      TextStyle(fontSize: 24);

  static const double iconSize = 40;

  static const IconThemeData iconThemeData =
      IconThemeData(color: Colors.white, size: iconSize);

  static ThemeData appThemeData = ThemeData(
    brightness: Brightness.dark,
    primaryColorDark: Colors.white,

    listTileTheme: const ListTileThemeData(
      shape: Border(bottom: BorderSide(color: Colors.white,width: 2)),

    ),

    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black54,
        iconTheme: ConstantStyles.iconThemeData,
        centerTitle: true),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      iconSize: ConstantStyles.iconSize,
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 20.0),
      headline6: TextStyle(fontSize: 20.0),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),
  );
}
