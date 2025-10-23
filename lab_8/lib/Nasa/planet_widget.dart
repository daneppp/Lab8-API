// the widget for a single planet choice

import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/planet.dart';

class PlanetWidget extends StatelessWidget {
  final Planet planet;
  const PlanetWidget({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(planet.name, style: TextStyle(fontSize: 25)),
                  Text(
                    "${planet.temp}°f",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Padding(padding: EdgeInsetsGeometry.all(5), child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(planet.description, style: TextStyle(color: const Color.fromARGB(255, 30, 30, 30), fontSize: 17)),
                )),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 66, 66),
                  foregroundColor: Colors.white,
                ),
                child: Text("Checkout!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
