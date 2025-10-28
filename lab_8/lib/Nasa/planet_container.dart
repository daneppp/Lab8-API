// manages the list of planets to be displayed on the page

import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/planet.dart';

class PlanetContainer extends ChangeNotifier {
  final List<Planet> planets = [];

  void addPlanet(Planet planet) {
    planets.add(planet);
    notifyListeners();
  }
}