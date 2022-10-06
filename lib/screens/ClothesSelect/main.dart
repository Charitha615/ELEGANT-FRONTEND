import 'package:flutter/material.dart';
import 'ShoppingItems.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: sitems('Male', 14, 32, 36),
      // home: sitems('Female', 14, 32, 36),
    );
  }
}
