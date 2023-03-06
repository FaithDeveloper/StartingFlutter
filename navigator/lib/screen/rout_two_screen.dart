import 'package:flutter/material.dart';
import 'package:navigator/layout/main_layout.dart';
import 'package:navigator/screen/rout_three_screen.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;

    return MainLayout(title: 'Route Two', children: [
      Text(
        'arguments = ${argument}',
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(456);
          },
          child: Text('Pop')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/three', arguments: 999);
          },
          child: Text('Push named')),

      // 현재 페이지를 이동할 페이지로 변경
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => RouteThreeScreen()));
          },
          child: Text('Push Replace')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/three');
          },
          child: Text('Push pushReplacementNamed')),

      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => RouteThreeScreen()),
              // Push 한 페이지 외에 모든 페이지가 route에 들어가게된다.
              // return false = remove, true = 유지
              (route) => route.settings.name == '/',
            );
          },
          child: Text('Push pushAndRemoveUntil')),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/three',
              (route) => route.settings.name == '/',
            );
          },
          child: Text('Push pushNamedAndRemoveUntil')),
    ]);
  }
}
