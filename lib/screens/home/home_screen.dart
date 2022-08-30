import 'package:elegant_fit_on/components/coustom_bottom_nav_bar.dart';
import 'package:elegant_fit_on/components/enums.dart';
import 'package:flutter/material.dart';



import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
