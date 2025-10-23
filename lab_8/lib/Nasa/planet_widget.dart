import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/planet.dart';

class PlanetWidget extends StatelessWidget{
  final Planet planet;
  const PlanetWidget({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Row(children: [
          Text(planet.name),
          Text(planet.temp.toString()),
        ],),
        Text(planet.description)
      ]),
    );
  }

}