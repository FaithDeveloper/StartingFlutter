import 'package:flutter/material.dart';
import 'package:navigator/layout/main_layout.dart';

class RouteThreeScreen extends StatelessWidget {
  const RouteThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;
    return MainLayout(title: 'Route Three', children: [
      Text('route argument = $argument'),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pop();
      }, child: Text('Pop'))
    ]);
  }
}
