import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/screen/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                _Header(),
                _Body(
                  randomNumbers: ramdomNumers,
                ),
                _Footer(onPress: onRandomNumberGenerate)
              ],
            ),
          )),
    );
  }

  onRandomNumberGenerate () {
    final rand = Random();

    final Set<int> nuwNumbers = {};
    while (nuwNumbers.length != 3) {
      final number = rand.nextInt(1000);
      nuwNumbers.add(number);
    }

    setState(() {
      ramdomNumers = nuwNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        '랜덤숫자 생성기',
        style: TextStyle(
            color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),
      ),
      IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context){
                return SettingsScreen();
              })
            );
          },
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
                child: Row(
                  children: x.value
                      .toString()
                      .split('')
                      .map((y) => Image.asset(
                            'asset/img/$y.png',
                            height: 70.0,
                            width: 50.0,
                          ))
                      .toList(),
                ),
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