import 'package:flutter/material.dart';
import 'package:navigator/screen/home_screen.dart';
import 'package:navigator/screen/rout_one_screen.dart';
import 'package:navigator/screen/rout_three_screen.dart';
import 'package:navigator/screen/rout_two_screen.dart';

void main() {
  runApp(MaterialApp(
    // home: HomeScreen(),
    initialRoute: '/',
    // www.google.com -> www.google.com/
    routes: {
      '/': (context) => HomeScreen(),
      '/one' : (context) => RouteOneScreen(),
      '/two' : (context) => RouteTwoScreen(),
      '/three' : (context) => RouteThreeScreen()
    },
  ));
}
