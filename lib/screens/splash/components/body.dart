import 'package:elegant_fit_on/components/constants.dart';
import 'package:elegant_fit_on/components/default_button.dart';
import 'package:elegant_fit_on/components/size_config.dart';
import 'package:elegant_fit_on/screens/LoginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import '../components/splash_content.dart';
import 'package:lottie/lottie.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Elegant, Let’s shop!",
      "image": "https://assets4.lottiefiles.com/packages/lf20_1t8na1gy.json"
    },
    {
      "text": "We help people connect with store \naround all over the world.",
      "image": "https://assets7.lottiefiles.com/packages/lf20_6wutsrox.json"
    },
    {
      "text":
          "We show the easy way to fit on clothes. \nJust stay at home with us",
      "image": "https://assets6.lottiefiles.com/packages/lf20_fmnkb5lo.json"

    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,

              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,

                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),

              ),

            ),

            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    Spacer(),
                    SizedBox(height: getProportionateScreenHeight(80)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        ),
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                new Color(0xFFDC54FE),
                                (new Color(0xFF246EE9)),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              (BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 50,
                                color: Color(0xffEEEEEE),
                              ))
                            ]),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
