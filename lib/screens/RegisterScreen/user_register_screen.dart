import 'package:dio/dio.dart';
import 'package:elegant_fit_on/screens/LoginScreen/header_widget.dart';
import 'package:elegant_fit_on/screens/LoginScreen/login_screen.dart';

import 'package:elegant_fit_on/services/common_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget() {
    String userEmail = '';
    String username = '';
    String userPhone = '';
    String userPass = '';
    String confirmPass = '';
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
              margin: EdgeInsets.only(left: 20, right: 20, top: 60),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
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
                    hintText: "Enter email",
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
                borderRadius: BorderRadius.circular(50),
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
                      Icons.person,
                      color: Color(0xFF2196F3),
                    ),
                    hintText: "Enter name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (value) {
                  username = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
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
                      Icons.phone,
                      color: Color(0xFF2196F3),
                    ),
                    hintText: "Enter contact number",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (value) {
                  userPhone = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 40),
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
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
                    hintText: "Enter password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                onChanged: (value) {
                  userPass = value;
                },
              ),
            ),
            GestureDetector(
              // onTap: () =>
              //     {registerUser(userEmail, username, userPhone, userPass)},
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
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
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      (BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE),
                      ))
                    ]),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?   "),
                  GestureDetector(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ))
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF2196F3),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void registerUser(
      String email, String username, String phone, String password) async {
    print("After String Print");

    if (email == "" || email == Null) {
      Fluttertoast.showToast(
          msg: "Please Enter Email",
          fontSize: 18,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else if (username == "" || username == Null) {
      Fluttertoast.showToast(
          msg: "Please Enter Username",
          fontSize: 18,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else if (phone == "" || phone == Null) {
      Fluttertoast.showToast(
          msg: "Please Enter Phone",
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
    }

    print("After If Else Print");
    try {
      var response = await Dio()
          .post(CommonService.LocalURL + "/UserRoute/register", data: {
        "user_email": email,
        "user_name": username,
        "user_phone": phone,
        "user_password": password,
        "user_type": "Student",
        "instructorID": "0",
        "studentRating": 0
      });
      print("datasss" + response.data.toString());

      if (response.statusCode == 200) {
        if (response.data["code"] == 208 &&
            response.data["status"] == "Email Exist") {
          Fluttertoast.showToast(
              msg: response.data["message"].toString(),
              fontSize: 18,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white);
        } else if (response.data["code"] == 208 &&
            response.data["status"] == "Username Exist") {
          Fluttertoast.showToast(
              msg: response.data["message"].toString(),
              fontSize: 18,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white);
        } else if (response.data["code"] == 208 &&
            response.data["status"] == "Phone Exist") {
          Fluttertoast.showToast(
              msg: response.data["message"].toString(),
              fontSize: 18,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white);
        } else if (response.data["status"] == "Success") {
          Fluttertoast.showToast(
              msg: "Registered Successfully.",
              fontSize: 18,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white);

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      }
    } catch (e) {
      print(e);
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
