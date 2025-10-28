import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lab_8/Nasa/planet.dart';

class QueryNasa {
  static Future<List<Planet>> fetchPlanets() async {
    final response = await http.get(
      Uri.parse(
        "https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,hostname,pl_orbper,pl_rade,pl_masse,sy_dist+from+ps+top+5&format=json",
      ),
    );

    if (response.statusCode == 200) {
      // if retrieved successfully
      // parse and return data
      final planetData = json.decode(response.body);
      print(planetData);
      List<Planet> planets = [];
      for (final planet in planetData) {
        planets.add(Planet(
          orbitPeriod: planet['pl_orbper'],
          distanceFromEarth: planet['pl_masse'],
          mass: planet['sy_dist'],
          radius: planet['pl_rade'],
          host: planet['hostname'],
          name: planet['pl_name'],
        ));
      }
      return planets;
    } else {
      throw Exception("Failed to Retrieve Data");
    }
  }
}

//https://exoplanetarchive.ipac.caltech.edu/TAP/sync?query=select+pl_name,hostname,pl_orbper,pl_rade,pl_masse,sy_dist+from+ps+top+5&format=json
