import 'package:flutter/material.dart';
import 'package:u_and_i/screen/HomeScreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      // 데이터 중앙화
        fontFamily: 'sunflower', // 디폴트 fontFamily
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white, fontFamily: 'parisienne', fontSize: 80.0),
            headline2: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700),
            bodyText1: TextStyle(color: Colors.white, fontSize: 30.0),
            bodyText2: TextStyle(color: Colors.white, fontSize: 30.0))),
    home: HomeScreen(),
  ));
}
