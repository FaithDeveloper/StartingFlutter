import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // debug 배너 지우고 싶을 때 
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  // build 안에 선언 시 hot real load 가 가능하다.
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFFF99231),
      // column : 세로로 여러개 위젯 넣을수 있다.
      // row: 가로 여러 위젯 넣을 수 있다.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'asset/img/logo.png',
          ),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
