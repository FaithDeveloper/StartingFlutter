import 'package:flutter/material.dart';

class TestHomeScreen extends StatelessWidget {
  const TestHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  // MainAxisAlignment - 주축 정렬
                  // Start - 시작
                  // end - 끝
                  // center - 가운데
                  // SpaceBetween - 위젯과 위젯 사이가 동일하게 배치
                  // spaceEvenly - 위젯을 같은 간격으로 배치 끝과 끝에도 위젯이 아닌 빈 간격으로 시작한다.
                  // spaceAround - spaceEvenly + 끝과 끝의 간격은 1/2
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  // CrossAxisAlignment - 반대축 정렬
                  // Start - 시작
                  // end - 끝
                  // center - 가운데
                  // stretch - 최대한으로 늘린다
                  crossAxisAlignment: CrossAxisAlignment.start,

                  // MainAxisSize - 주축크기
                  // Max - 최대
                  // Min - 최소
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.orange,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.green,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.orange,
                ),
                Row(
                  // MainAxisAlignment - 주축 정렬
                  // Start - 시작
                  // end - 끝
                  // center - 가운데
                  // SpaceBetween - 위젯과 위젯 사이가 동일하게 배치
                  // spaceEvenly - 위젯을 같은 간격으로 배치핮미ㅏㄴ 끝과 끝에도 위젯이 아닌 빈 간격으로 시작한다.
                  // spaceEvenly - spaceEvenly + 끝과 끝의 간격은 1/2
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.orange,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.yellow,
                      width: 50.0,
                      height: 50.0,
                    ),
                    Container(
                      color: Colors.green,
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
                Container(
                  width: 50.0,
                  height: 50.0,
                  color: Colors.green,
                ),
              ],
            )),
      ),
    );
  }
}
