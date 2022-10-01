import 'package:flutter/material.dart';

class ConstantStyles {
static TextStyle textFormFieldStyle = const TextStyle( fontSize: 16 );
static TextStyle labelStyle = const TextStyle( fontSize: 20,color: Colors.blueAccent);
static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  shadowColor: Colors.greenAccent,
  backgroundColor: Colors.indigoAccent,
  minimumSize: const Size(150, 50),
);
static TextStyle textStyle = const TextStyle(fontSize: 20, color: Colors.white);
}