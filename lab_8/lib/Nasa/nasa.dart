// the rent a planet ui page

import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/planet_container.dart';
import 'package:lab_8/Nasa/planet_list.dart';
import 'package:lab_8/Nasa/query_nasa.dart';
import 'package:provider/provider.dart';

class nasa extends StatelessWidget {
  const nasa({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Galactic Properties',
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Expanded(child: InputBox(label: "Planet Name")),
              const Expanded(child: InputBox(label: "Distance")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Search')),
              ElevatedButton(
                onPressed: () async {
                  for(final planet in await QueryNasa.fetchPlanets()) {
                    context.read<PlanetContainer>().addPlanet(planet);
                  }
                },
                child: const Text(
                  'Browse \nCataloge',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(child: PlanetList()),
        ],
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  final String label;
  const InputBox({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
