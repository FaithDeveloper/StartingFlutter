import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int maxNumber = 1000;
  List<int> ramdomNumers = [123, 456, 789];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: PRIMART_COLOR,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(onPressed: onSettingsPop),
                _Body(
                  randomNumbers: ramdomNumers,
                ),
                _Footer(onPress: onRandomNumberGenerate)
              ],
            ),
          )),
    );
  }

  // 설정 화면에서 Pop 하였을 때 데이터 가져옴
  void onSettingsPop () async { // async 로 미래의 데이터를 가져오도록 설정한다.
    final result = await Navigator.of(context).push<int>(  // int 옵셔널러 return 을 해준다.
        MaterialPageRoute(builder: (BuildContext context){
          return SettingsScreen(maxNumber: maxNumber.toDouble(),);
        })
    );

    if(result != null) {
      setState(() {
        maxNumber = result;
      });
    }
  }

  void onRandomNumberGenerate () {
    final rand = Random();

    final Set<int> nuwNumbers = {};
    while (nuwNumbers.length != 3) {
      final number = rand.nextInt(maxNumber);
      nuwNumbers.add(number);
    }

    setState(() {
      ramdomNumers = nuwNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '랜덤숫자 생성기',
        style: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),
      ),
      IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.settings,
            color: RED_COLOR,
          ))
    ]);
  }
}

class _Body extends StatelessWidget {
  List<int> randomNumbers;

  _Body({required this.randomNumbers, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: randomNumbers
              .asMap()
              .entries
              .map((x) => Padding(
            padding: EdgeInsets.only(bottom: x.key == 2 ? 0 : 16.0),
            child: NumberRow(number: x.value,),
          ))
              .toList(),
        ));
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPress;
  const _Footer({required this.onPress, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: RED_COLOR),
            onPressed: onPress,
            child: Text('생성하기')));
  }
}