import 'package:elegant_fit_on/components/constants.dart';
import 'package:elegant_fit_on/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Text(
          "Elegant Fit On",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(40),
            color: Color(0xFFDC54FE),
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Spacer(flex: 2),
        // Image.asset(
        //   image!,
        //   height: getProportionateScreenHeight(265),
        //   width: getProportionateScreenWidth(255),
        // ),
        Lottie.network(
          image!,
            height: getProportionateScreenHeight(300),
            width: getProportionateScreenWidth(300),
        )
      ],
    );
  }
}
