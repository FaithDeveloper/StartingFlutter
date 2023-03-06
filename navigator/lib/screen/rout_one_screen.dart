import 'package:flutter/material.dart';
import 'package:navigator/screen/rout_two_screen.dart';

import '../layout/main_layout.dart';

class RouteOneScreen extends StatelessWidget {
  final int? number;

  const RouteOneScreen({this.number, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: 'Route One Screen', children: [
      Text(
        'argument = ${number.toString()}',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).maybePop();
          },
          child: Text('maybe Pop')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(123);
          },
          child: Text('Pop')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => RouteTwoScreen(),
                settings: RouteSettings(arguments: 789)));
          },
          child: Text('Push'))
    ]);
  }
}
