import 'package:flutter/material.dart';
import 'package:random_number/component/number_row.dart';
import 'package:random_number/constant/color.dart';

class SettingsScreen extends StatefulWidget {
  final double maxNumber;
  const SettingsScreen({required this.maxNumber, Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double maxNumber = 1000;

  @override
  void initState() {
    super.initState();
    // 초창기 build 보다 더 빨리 호출함
    maxNumber = widget.maxNumber; // wiget의 있는 것을 가져옴
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMART_COLOR,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Bodys(
                  maxNumber: maxNumber,
                ),
                _Footer(
                    maxNumber: maxNumber,
                    onSlider: onSlider,
                    onButtonClick: onButtonClick),
              ],
            ),
          ),
        ));
  }

  onSlider(double val) {
    setState(() {
      maxNumber = val;
    });
  }

  onButtonClick() {
    Navigator.of(context).pop(maxNumber.toInt());
  }
}

class _Bodys extends StatelessWidget {
  final double maxNumber;

  const _Bodys({required this.maxNumber, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NumberRow(number: maxNumber.toInt(),),
    );
  }
}

class _Footer extends StatelessWidget {
  final double maxNumber;
  final ValueChanged<double> onSlider;
  final VoidCallback onButtonClick;

  const _Footer(
      {required this.maxNumber,
        required this.onSlider,
        required this.onButtonClick,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Slider(value: maxNumber, min: 1000, max: 100000, onChanged: onSlider),
        ElevatedButton(
            onPressed: onButtonClick,
            style: ElevatedButton.styleFrom(primary: RED_COLOR),
            child: Text('저장!')),
      ],
    );
  }
}