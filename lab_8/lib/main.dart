import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/nasa.dart';
import 'package:lab_8/Nasa/planet_container.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => PlanetContainer(), // provide planetContainer to the app
      child: MaterialApp(home: const MainApp()),
    ),
  );
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
        appBar: AppBar(title: const Text('Lab 8 API'), backgroundColor: Colors.amber,),
        body: tabs[index],
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
