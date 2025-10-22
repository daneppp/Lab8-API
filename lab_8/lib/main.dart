import 'package:flutter/material.dart';
import 'package:lab_8/nasa.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key,});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;

  final List<Widget> tabs = [
    const nasa(),
    const Text('Danes'), // attach your page here
  ];

  void tabTapped(int i) {
    setState(() => index = i,);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: tabs[index],                                               // bottom nav bar
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: tabTapped,
          items: const [
            BottomNavigationBarItem(label: 'Nasa', icon: Icon(Icons.star)),
            BottomNavigationBarItem(label: 'Pokemon', icon: Icon(Icons.face)),
          ],
        ),
      ),
    );
  }
}
