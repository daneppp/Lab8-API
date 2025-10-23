import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/planet_container.dart';
import 'package:lab_8/Nasa/planet_widget.dart';
import 'package:provider/provider.dart';

class PlanetList extends StatelessWidget {
  const PlanetList({super.key});

  @override
  Widget build(BuildContext context) {
    PlanetContainer planetContainer = context.watch<PlanetContainer>(); // watch for changes
    
    return ListView(
      children: planetContainer.planets
        .map((c) => PlanetWidget(planet: c)) // converts planets to widgets
        .toList(), // convert to list
    );
  }
}