import 'dart:async';
import 'package:hexcolor/hexcolor.dart';
import 'package:elegant_fit_on/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Color primaryColor = HexColor('#DC54FE');
Color accentColor = HexColor('#8A02AE');

class FSplashScreen extends StatefulWidget {
  FSplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<FSplashScreen> {
  bool _isVisible = false;

  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 2500), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SplashScreen()),
            (route) => false);
      });
    });

    new Timer(Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            new Color(0xFFDC54FE),
            (new Color(0xFFDC54FE)),
          ],
          begin: const FractionalOffset(0, 0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1800),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            child: Center(
              child: ClipOval(
                // child: Icon(
                //   Icons.android_outlined,
                //   size: 128,
                // ), /
                child: Image.asset(
                  "assets/images/Picture1.png",
                  // height: 120,
                  // width: 140,
                ),
              ),
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2.0,
                    offset: Offset(5.0, 3.0),
                    spreadRadius: 2.0,
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
