import 'package:elegant_fit_on/components/coustom_bottom_nav_bar.dart';
import 'package:elegant_fit_on/components/enums.dart';
import 'package:flutter/material.dart';


import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text("ELEGANT FIT ON",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 181, 10, 224))),
          ),
          backgroundColor: Color.fromARGB(255, 247, 247, 247),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Container(
                //  alignment: Alignment.topRight,
                width: 80,
                child: Image.asset(
                  'assets/images/Picture1.png',
                ),
              ),
            ),
          ],
        ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
