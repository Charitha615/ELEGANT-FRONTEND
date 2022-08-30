import 'package:elegant_fit_on/screens/home/home_screen.dart';
import 'package:elegant_fit_on/screens/profile/profile_screen.dart';
import 'package:elegant_fit_on/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
};
