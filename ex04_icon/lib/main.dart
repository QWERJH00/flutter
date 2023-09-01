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
      home: const MyHomePage(title: 'ex04_icon'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Row(  // 아이콘은 상수이기때문에 아래 모두 
                        // 상수처리하지말고 여기서 상수처리하면 됨.
        children: <Widget>[ // 우리가 만들고 자동으로 완성된 코드에는
                            // 앞에있는 <widget>이 없다. 없어도 된다는 뜻.
          Icon(
            Icons.camera_alt,
            color: Colors.red,
            size: 35.0,
          ),
          Icon(
            Icons.cancel,
            color: Colors.orange,
            size: 35.0,
          ),
          Icon(
            Icons.account_circle,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 35.0,
          ),
          Icon(
            Icons.add_ic_call_rounded,
            color: Color.fromARGB(255, 0, 255, 64),
            size: 35.0,
          ),
          Icon(
            Icons.content_paste_search,
            color: Color.fromARGB(255, 11, 54, 196),
            size: 35.0,
          ),
          Icon(
            Icons.alternate_email,
            color: Color.fromARGB(255, 228, 225, 56),
            size: 35.0,
          ),
          Icon(
            Icons.transgender_rounded,
            color: Color.fromARGB(255, 0, 255, 64),
            size: 35.0,
          ),
          Icon(
            Icons.border_color,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 35.0,
          ),
          Icon(
            Icons.incomplete_circle,
            color: Color.fromARGB(255, 4, 0, 255),
            size: 35.0,
          ),
        ],
      ),
    );
  }
}