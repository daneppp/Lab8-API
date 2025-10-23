import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/planet.dart';

class PlanetContainer extends ChangeNotifier {
  final List<Planet> planets = [];

  void addJoke(Planet planet) {
    planets.add(planet);
    notifyListeners();
  }
}