import 'package:flutter/material.dart';
import 'page_a2.dart';

class PageA1 extends StatefulWidget {
  const PageA1({super.key});

  @override
  State<PageA1> createState() => _PageA1State();
}

class _PageA1State extends State<PageA1>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page A-1'),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page A-1', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 30,),
            ElevatedButton(
              child: const Text('2페이지 추가',
                                style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.push(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const PageA2(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              }, 
              )
          ],
        ),
      ),
    );
  }
}