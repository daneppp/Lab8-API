// the widget for a single planet choice

import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/planet.dart';

class PlanetWidget extends StatelessWidget {
  final Planet planet;
  const PlanetWidget({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(1),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsetsGeometry.all(5),
          child: Column(
            children: [
              Text(
                planet.name ?? 'Unkown',
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              PlanetQuality(label: "Radius:", value: planet.radius?.toString() ?? "Unknown"),
              PlanetQuality(
                label: "Orbital Period:",
                value: planet.orbitPeriod?.toString() ?? "Unkown",
              ),
              PlanetQuality(
                label: "Distance From Earth:",
                value: planet.distanceFromEarth?.toString() ?? "Unkown",
              ),
              PlanetQuality(label: "Mass:", value: planet.mass?.toString() ?? "Unknown"),
              PlanetQuality(label: "Radius:", value: planet.radius?.toString() ?? "Unknown"),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Added to cart!'),
                      action: SnackBarAction(
                        label: 'Close',
                        onPressed: () {},
                      ),
                    ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 66, 66),
                  foregroundColor: Colors.white,
                ),
                child: Text("+Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanetQuality extends StatelessWidget {
  final String label;
  final String value;

  const PlanetQuality({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label, style: TextStyle(fontSize: 20),), Text(value, style: TextStyle(fontSize: 20))],
    );
  }
}
