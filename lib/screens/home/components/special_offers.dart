import 'package:elegant_fit_on/screens/Clothes/menTclothes.dart';
import 'package:elegant_fit_on/screens/Clothes/mendenimclothes.dart';
import 'package:elegant_fit_on/screens/Clothes/shirts/shirts.dart';
import 'package:elegant_fit_on/screens/Clothes/shorts/shorts.dart';
import 'package:flutter/material.dart';

import 'package:elegant_fit_on/components/size_config.dart';
import '../../ClothesSelect/MaleSizeSelection.dart';
import '../../ClothesSelect/ShoppingItems.dart';
import '../../ClothesSelect/msrnt.dart';
import '../../tshirts_screen/tshirt.dart';
import 'section_title.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mygender;
    int myshoulderwidth = 0;
    int myhip = 0;
    int myleglength = 0;
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Men's",
            press: () {},
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/TShirtsbanner1.png",
                category: "T shirts",
                numOfBrands: 18,
                press: () {
                  var i = 0;
                  var j = 0;
                  var k = 0;
                  var s = "";
                  Navigator.push(
                    context,
                    MaterialPageRoute(  
                        builder: (context) => TshirtsItems()),
                  );
                },
              ),
              SpecialOfferCard(
                image: "assets/images/mendenimes.jpg",
                category: "Denims",
                numOfBrands: 24,
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp3(),
                      ));
                },
              ),
              SpecialOfferCard(
                image: "assets/images/Men-shorts-Banner.jpg",
                category: "Shorts",
                numOfBrands: 10,
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
