import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/nasa.dart';
import 'package:lab_8/Nasa/planet.dart';
import 'package:lab_8/Nasa/planet_container.dart';
import 'package:provider/provider.dart';

void main() {
  PlanetContainer con = PlanetContainer();
  con.addPlanet(Planet(name: "Mars",description: "red dust and deserts, enjoy low gravity and cool temps with plenty of crators", temp: -40));
  con.addPlanet(Planet(name: "Earth",description: "full of dumb hairless apes that do entertaining things like war and politics. sit back with popcorn and enjoy the show", temp: 60));

  runApp(
    ChangeNotifierProvider(
      create: (context) => con, // provide planetContainer to the app
      child:  const MainApp(),
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
