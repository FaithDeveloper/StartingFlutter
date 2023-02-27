import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
            onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.black
                ),
                // Material State
                //
                // hovered - 호버링 상태 (마우스 커서를 올려놓는 상태)
                // focused - 포커스 됬을 때 (텍스트 필드)
                // pressed - 눌렸을 때
                // dragged - 드래그 됐을때
                // selected - 선택퇬을때 (체크박스 라디오버튼)
                // scrollUnder - 다른 컴포넌트 밑으로 스크롤링 됐을 때
                // disabled - 비활성화 퇬을 때
                // error - 에러상태
                foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                  if(states.contains(MaterialState.pressed)){
                    return Colors.white;
                  }
                  return Colors.red;
                }),
                padding: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                  if(states.contains(MaterialState.pressed)){
                    return EdgeInsets.all(100.0);
                  }
                  return EdgeInsets.all(20.0);
                })
              ),
              child: Text('Button Style'),
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    // 메인 칼라 (배경색)
                    primary: Colors.red,
                    // 글자 및 애니메이션 색상 지정
                    onPrimary: Colors.black,
                    // 그림자 색상 지정
                    shadowColor: Colors.green,
                    // 3D 입체감 높임  
                    elevation: 10.0,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0
                    ),
                  padding: EdgeInsets.all(32.0),
                  side: BorderSide( // 테두리 색상
                    color: Colors.black,
                    width: 4.0,
                  )
                ),
                child: Text("ElevatedButton")),
            OutlinedButton(onPressed: () {},
            style: OutlinedButton.styleFrom(
              // 글자 애니메이션 색상
                primary: Colors.green,

            ),
                child: Text("OutlineButton")),
            TextButton(onPressed: () {},
            style: TextButton.styleFrom(
              primary: Colors.brown,
              backgroundColor: Colors.blue
            ),
                child: Text('TextButton'))
          ],
        ),
      ),
    );
  }
}
