import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'How to Do Loja Stores',
      theme: ThemeData(
        primaryColor: Colors.amber,
        backgroundColor: Colors.red,
        accentColor: Colors.yellow,
      ),
    ).modular();
  }
}