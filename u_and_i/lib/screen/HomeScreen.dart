import 'package:flutter/cupertino.dart'; // ios 와 비슷한 화면 구성
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], //default : 500 낮아질수록 연해진다.
      body: SafeArea(
        bottom: false,
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                _TopPart(selectedDate: selectedDate, onPressed: onHeartPressed),
                _BottomPart()
              ],
            )),
      ),
    );
  }

  onHeartPressed() {
    final DateTime now = DateTime.now();
    showCupertinoDialog(
        context: context,
        barrierDismissible: true, // 밖에 눌렀을 때 닫히게 할 수 있다.
        builder: (BuildContext context) {
          return Align(
            // 어디에 정렬할지 알려줄 수 있다.
            alignment: Alignment.bottomCenter,
            child: Container(
              // 어디에 정렬해야하는지 모를 때 전체다 먹어버린다.
              color: Colors.white,
              height: 300.0,
              child: CupertinoDatePicker(
                initialDateTime: selectedDate,
                maximumDate: DateTime(now.year, now.month, now.day),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          );
        });
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({required this.selectedDate, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 위젯 트리에서 가장 가까운 Theme를 가져온다.
    // final size = MediaQuery.of(context).size; // 위젯 트리에서 가장 가까운 MediaQuery의 Size 가져온다.
    final DateTime now = DateTime.now();
    final textTheme = theme.textTheme;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "U&I",
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만나 날',
                  style: textTheme.bodyText1
              ),
              Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyText2
              ),
            ],
          ),
          IconButton(
              onPressed: onPressed,
              iconSize: 60.0,
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              )),
          Text(
            'D+${DateTime(now.year, now.month, now.day).difference(selectedDate).inDays + 1}',
              style: textTheme.headline2
          ), // fontWeight 로 굵기를 조절 가능하다
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png'));
  }
}
