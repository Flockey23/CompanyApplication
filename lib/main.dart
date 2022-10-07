import 'package:flutter/material.dart';
import 'package:myapp/presentation/util/constant_styles.dart';
import 'package:myapp/presentation/ui/pages/Authorization/authorization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ConstantStyles.appThemeData,
      home: const Authorization(),
    );
  }
}
