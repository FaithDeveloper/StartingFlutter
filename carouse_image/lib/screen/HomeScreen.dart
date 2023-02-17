import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  // 모든 controller 는 dispose 에 메모리 할당 지워야한다.
  PageController controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int currentPage =
      controller.page!.toInt(); //double 인 경우는 스와이프 도중은 소스점으로 표시하여 그렇다.
      int nextPage = currentPage + 1;

      if (nextPage > 4) {
        nextPage = 0;
      }
      // curve : 애니메이션이 어떻게 실행할지 지정할 수 있다. ex) 빠르게-> 느리게
      controller.animateToPage(nextPage,
          duration: Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView(
        controller: controller,
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Image.asset(
            'asset/img/image_$e.jpeg',
            fit: BoxFit.cover,
          ),
        )
            .toList(),
      ),
    );
  }
}
// Image.asset('asset/img/image_1.jpeg', fit: BoxFit.cover,),
