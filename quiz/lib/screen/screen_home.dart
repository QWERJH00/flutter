import 'package:flutter/material.dart';
import 'package:quiz/model/model_quiz.dart';
import 'package:quiz/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title' : '조선시대 16대 왕은?',
      'candidates' : ['예종', '선조', '현종', '인조'],
      'answer' : 3
    }),
    Quiz.fromMap({
      'title' : '주기율표 50번째 원소는?',
      'candidates' : ['As(비소)', 'I(아이오딘/요오드)', 'Sn(주석)', 'Br(브로민/브롬)'],
      'answer' : 2
    }),
    Quiz.fromMap({
      'title' : '세계에서 가장 오래된 악기는?',
      'candidates' : ['바통', '바이올린', '첼로', '플룻'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : '패리티가격(Parity Price)을 실시하는 목적은?',
      'candidates' : ['생산자 보호', '소비자 보호', '근로자 보호', '독점의 제한'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title' : '리그 오브 레전드 챔피언중 86번째로 출시된 챔피언은?',
      'candidates' : ['볼리베어', '피즈', '쉬바나', '레넥톤'],
      'answer' : 2
    }),
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    // ignore: unused_local_variable
    double height = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Quiz App'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/Quiz.png',
                width: width * 0.5,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(width * 0.024),
            // ),
            Text(
              '술자리 퀴즈!',
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '술자리가 지루해질때 시작해보세요!',
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            _bulidStep(width, '1. 랜덤으로 나오는 퀴즈 3개를 풀어보세요.'),
            _bulidStep(width, '2. 정답을 고르고 다음으로 넘어가세요.'),
            _bulidStep(width, '3. 만점에 도전해보세요!'),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    child: const Text(
                      '지금 퀴즈 풀기',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) =>
                        QuizScreen(quizs: quizs,)
                        )
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Widget _bulidStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        width * 0.048, 
        width * 0.024, 
        width * 0.048, 
        width * 0.024
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      ),
    );
  }
}