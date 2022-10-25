import 'dart:async';

import 'package:dio/dio.dart';
import 'package:elegant_fit_on/components/size_config.dart';
import 'package:elegant_fit_on/screens/LoginScreen/header_widget.dart';
import 'package:elegant_fit_on/screens/RegisterScreen/user_register_screen.dart';
import 'package:elegant_fit_on/screens/home/home_screen.dart';
import 'package:elegant_fit_on/services/common_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    String userEmail = '';
    String userPass = '';
    double _headerHeight = 250;
    Key _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   height: 400,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(1000),
            //         bottomRight: Radius.circular(0),
            //         topLeft: Radius.circular(0),
            //         topRight: Radius.circular(0)),
            //     // color: Color(0xFF2196F3),
            //     gradient: LinearGradient(
            //       colors: [
            //         Color.fromARGB(255, 100, 100, 192),
            //         Color.fromARGB(255, 237, 237, 237)
            //       ],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //     ),
            //   ),
            //   child: Center(
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Padding(
            //           padding: const EdgeInsets.only(top: 0, left: 0),
            //           child: Container(
            //             child: Image.asset(
            //               "assets/images/Picture1.png",
            //               height: 320,
            //               width: 320,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 50, top: 20),
            //           child: Text(
            //             "Elegant Fit on!",
            //             style: TextStyle(
            //               fontSize: 35,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true,
                  Icons.login_rounded), //let's create a common header widget
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 80),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                cursorColor: Color(0xFF2196F3),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Color(0xFF2196F3),
                    ),
                    hintText: "Enter your email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (value) {
                  userEmail = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE))
                ],
              ),
              alignment: Alignment.center,
              child: TextField(
                obscureText: true,
                cursorColor: Color(0xFF2196F3),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      color: Color(0xFF2196F3),
                    ),
                    hintText: "Enter your password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (value) {
                  userPass = value;
                },
              ),
            ),
            GestureDetector(
              // onTap: () => {loginUser(userEmail, userPass)},
              onTap: () => {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.all(16),
                          height: 60,
                          // decoration: BoxDecoration(
                          //     color: Color(0xFF2784EC),
                          //     // color:Colors.transparent,
                          //     borderRadius:
                          //         BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 48,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                ),
                              ),
                            ],
                          )),
                      Center(
                        child: Positioned(
                          // bottom: 0,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                            ),
                            child: Lottie.network(
                                'https://assets9.lottiefiles.com/packages/lf20_bo8vqwyw.json',
                                height: 80,
                                width: 80),
                          ),
                        ),
                      ),
                    ],
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                )),
                new Timer(const Duration(milliseconds: 4500), () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                }),
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 80),
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        new Color(0xFF246EE9),
                        (new Color(0xFFDC54FE)),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      (BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE),
                      ))
                    ]),
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, right: 20),
              alignment: Alignment.center,
              child: GestureDetector(
                child: Text("Forgot Password?"),
                onTap: () => {},
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text("Don't have an Account?  "),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      ),
                    },
                    child: Text(
                      "Don't have an Account?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginUser(String email, String password) async {
    if (email == "" || email == Null) {
      Fluttertoast.showToast(
          msg: "Please Enter Email",
          fontSize: 18,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else if (password == "" || password == Null) {
      Fluttertoast.showToast(
          msg: "Please Enter Password",
          fontSize: 18,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else if (!isEmail(email)) {
      Fluttertoast.showToast(
          msg: "Please enter a valid email.",
          fontSize: 18,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      try {
        var responsee = await Dio().post(
            CommonService.LocalURL + "/UserRoute/login",
            data: {"user_email": email, "user_password": password});

        print("datasss" + responsee.data.toString());
        print("response.statusCode" + responsee.statusCode.toString());

        if (responsee.statusCode == 200) {
          Fluttertoast.showToast(
              msg: "Successfully Logged Teacher",
              fontSize: 18,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => UserHome(),
          //     ));
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(
              'user_email', responsee.data["data"]["user_email"].toString());

          await prefs.setString(
              'user_name', responsee.data["data"]["user_name"].toString());

          await prefs.setString(
              'user_id', responsee.data["data"]["_id"].toString());

          await prefs.setString(
              'user_type', responsee.data["data"]["user_type"].toString());

          var userEmail = prefs.getString('user_email');
          var userName = prefs.getString('user_name');
          var user_id = prefs.getString('user_id');

          print("user_Email :" + responsee.data["data"]["user_email"]);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }

  bool isPassword(String password) {
    String p = r'(?=.*\d)(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z]).{8,}$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(password);
  }
}
