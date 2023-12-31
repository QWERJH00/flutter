import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ex24_timepicker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 현재 시간 가져오기
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 전역변수를 통해 시간과 분을 화면에 출력한다.
            Text(
              '${_selectedTime.hour}:${_selectedTime.minute}',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child: const Text('Show DatePicker',
                                style: TextStyle(fontSize: 24)),
              onPressed: () => selectTime(), 
            ),
          ],
        ),
      ),
    );
  }

  Future selectTime() async {
    // showTimePicker객체가 반환한 값을 통해 선택한 시간 설정
    TimeOfDay? picked = await showTimePicker(
      /*
        context값이 필요하면 future타입으로 TimeOfDay타입의 값을
        반환한다. TimeOfDay 클래스에는 시간과 분 정보가 있다.
      */
      context: context, 
      initialTime: TimeOfDay.now(),   // 초기상태의 시간을 설정
      // ### ----------------------------------------------
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              // border color 바꾸기
              primary: Colors.pink,
              // text color 바꾸기
              onSurface: Colors.pink,
            ),
          ), 
          child: child!,
        );
      },  // 여기서 사용자가 시간을 선택할 때 까지 코드가 블록됨.
    );
    // 타임피커를 통해 선택한 시간으로 설정.
    if(picked != null) {
        setState(() {
          _selectedTime = picked;
        });
      }
  }
}