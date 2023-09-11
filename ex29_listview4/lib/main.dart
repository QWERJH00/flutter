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
      home: const MyHomePage(title: 'ex29_listview4'),
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

  late List<Person> persons;

  @override
  void initState() {
    super.initState();

    persons = [];
    for (int i=0; i<15; i++) {
      persons.add(Person(i+21, '홍길동$i', true));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
        /*
          3. ListView.separated를 사용해서 Lazy하게 생성.
          아이템 사이의 구분선도 Lazy하게 생성.
        */
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index) {
          return PersonTile(persons[index], index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(     // 구분선
            color: Colors.transparent, // 하얀색 구분선
            height: 1,      
            // thickness: 1.0,
          );
        },
      ),
    );
  }
}

class Person {
  int age;
  String name;
  bool isLeftHand;

  Person (this.age, this.name, this.isLeftHand);  // 생성자
}

// PersonTile 정의
class PersonTile extends StatelessWidget {
  final Person _person;
  final int index;    // 타일에 추가 데이터가 필요한 경우 생성자에 추가하면 된다.

  const PersonTile(this._person, this.index, {super.key});

  @override
  Widget build(BuildContext context) {

    // 리스트 타일 대신 카드를 사용
    return Card(
      color: Colors.amber[100], // 배경색
      elevation: 0,
      // 카드의 테두리 속성(색깔, 두께, 원형적용)
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(0),
      ),
      child: InkWell(

        splashColor: Colors.blue, // 클릭했을때 변환하는 색깔
        onTap: () {
          print('$index번 타일 클릭됨');
        },
        child: Row(
          children: [
            // 좌측 아이콘 영역
            const SizedBox(
              width: 100,
              height: 150,
              child: Icon(
                Icons.account_box,
                size: 50.0,
              ),
            ),
            Expanded(
            // 가운데 텍스트 출력 부분
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(  // 이름
                    _person.name,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text( // 나이
                    "'${_person.age}세'",
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$index번 타일',
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        // 엘리베이티드 버튼 추가(클릭시 외부 메서드 호출)
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          child: const Text('ElevatedButton',
                            style: TextStyle(fontSize: 24),),
                          onPressed: () => _onClick(index), 
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _onClick(int index) {
    print('$index 클릭됨');
  }
}