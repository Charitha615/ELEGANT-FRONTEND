
import 'package:elegant_fit_on/screens/3DAvatar/video.dart';
import 'package:elegant_fit_on/screens/SplashScreen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FSplashScreen(title: 'Flutter Login UI'),
    );
  }
}
