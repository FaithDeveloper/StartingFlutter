import 'package:flutter/material.dart';
import 'package:navigator/screen/rout_one_screen.dart';

import '../layout/main_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        // true - pop 가능
        // false - pop 불가능
        return false;

        // 작업 실행
        // final canPop = Navigator.of(context).canPop();
        // return canPop
      },
      child: MainLayout(title: 'HomeScreen', children: [
        ElevatedButton(
            onPressed: () {
              print(Navigator.of(context).canPop());
            },
            child: Text('can pop')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            child: Text('maybe Pop')),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Pop')),
        ElevatedButton(
            onPressed: () async {
              final result = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => RouteOneScreen(
                    number: 123,
                  ),
                ),
              );
              print(result.toString());
            },
            child: Text('Push')),
      ]),
    );
  }
}
