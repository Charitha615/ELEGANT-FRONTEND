import 'package:elegant_fit_on/components/size_config.dart';
import 'package:flutter/material.dart';

import '../../3DAvatar/instruct.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => instruct(),
              );
      },
      child: Container(
        // alignment: Alignment.center,
        // height: 90,
        width: double.infinity,
        margin: EdgeInsets.all(getProportionateScreenWidth(20)),
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(210, 44, 9, 241),
              Color.fromARGB(255, 181, 10, 224),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text.rich(
          TextSpan(
            style: TextStyle(color: Color.fromARGB(253, 255, 255, 255)),
            children: [
              TextSpan(text: "All the good stuff is here...!\n\n"),
              // TextSpan(text: "click here...\n"),

              TextSpan(
                // text: "Cashback 20%",
                text: "\t\t\t\t\t\t\t\tStart the Journey",
                
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
