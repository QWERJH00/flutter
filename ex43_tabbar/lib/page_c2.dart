import 'package:flutter/material.dart';

class PageC2 extends StatefulWidget {
  const PageC2({super.key});

  @override
  State<PageC2> createState() => _PageC2State();
}

class _PageC2State extends State<PageC2>
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
        title: const Text('Page C-2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page C-2', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 30,),
            ElevatedButton(
              child: const Text('2페이지 제거',
                                style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.pop(context);
              }, 
            ),
          ],
        ),
      ),
    );
  }
}      
