import 'package:flutter/material.dart';
import 'package:shoppingmall/widget/bottom_bar.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bbongflix',
      theme: ThemeData(
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              ScreenHome(),
              ScreenSearch(),
              ScreenCart(),
              ScreenProflie(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}