import 'package:elegant_fit_on/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:elegant_fit_on/screens/Voice/voice.dart';
import 'package:elegant_fit_on/screens/ClothesSelect/ShoppingItems.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/avatar-svgrepo-com.svg", "text": "Avatar"},
      {
        "icon": "assets/icons/voice-one-svgrepo-com.svg",
        "text": "Voice",
        "press": "VoicePage()"
      },
      {
        "icon": "assets/icons/baseball-clothes-svgrepo-com.svg",
        "text": "Clothes ",
        "press": ""
      },
      {
        "icon": "assets/icons/history-svgrepo-com (1).svg",
        "text": "History",
        "press": ""
      },
      {
        "icon": "assets/icons/more-svgrepo-com.svg",
        "text": "More",
        "press": ""
      },
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => sitems('Male', 16, 32, 32),//myshoulderwidth, myhip, myleglength
                  // builder: (context) => sitems('Male', 14, 34, 34),//myshoulderwidth, myhip, myleglength
                  // builder: (context) => sitems('Male', 20, 36, 36),//myshoulderwidth, myhip, myleglength

                  // builder: (context) => categories[index]
                  //     ["press"], //myshoulderwidth, myhip, myleglength
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}