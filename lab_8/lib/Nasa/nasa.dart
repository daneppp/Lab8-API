// the rent a planet ui page

import 'package:flutter/material.dart';
import 'package:lab_8/Nasa/planet_container.dart';
import 'package:lab_8/Nasa/planet_list.dart';
import 'package:lab_8/Nasa/query_nasa.dart';
import 'package:provider/provider.dart';

class Nasa extends StatefulWidget {
  const Nasa({super.key});

  @override
  State<Nasa> createState() => _NasaState();
}

class _NasaState extends State<Nasa> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();

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
              Expanded(
                child: InputBox(
                  label: "Planet Name",
                  controller: nameController,
                ),
              ),
              Expanded(
                child: InputBox(
                  label: "Distance",
                  controller: distanceController,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () async{
                context.read<PlanetContainer>().clearPlanets();
                for (final planet in await QueryNasa.fetchPlanets(nameController.text.trim(), distanceController.text.trim())) {
                    context.read<PlanetContainer>().addPlanet(planet);
                  }
                  nameController.clear();
                  distanceController.clear();
              }, child: const Text('Search')),
              ElevatedButton(
                onPressed: () async {
                  context.read<PlanetContainer>().clearPlanets();
                  for (final planet in await QueryNasa.fetchPlanets(null, null)) {
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
  final TextEditingController controller;

  const InputBox({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
