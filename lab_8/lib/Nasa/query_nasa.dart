import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:lab_8/Nasa/planet.dart';

class QueryNasa {
  static String formatQuery(String? name, String? distance){
   return 'query=select+top+5+pl_name,hostname,pl_orbper,pl_rade,pl_masse,sy_dist+from+ps'
    '${((name?.isNotEmpty ?? false) || (distance?.isNotEmpty ?? false)) ? '+where+' : ''}'
    '${(name?.isNotEmpty ?? false) ? 'pl_name=\'$name\'' : ''}'
    '${((name?.isNotEmpty ?? false) && (distance?.isNotEmpty ?? false)) ? '+and+' : ''}'
    '${(distance?.isNotEmpty ?? false) ? 'sy_dist<$distance' : ''}';
  }

  static Future<List<Planet>> fetchPlanets(String? name, String? distance) async {
    print(formatQuery(name, distance));
    final response = await http.get(
      Uri.parse(
        "https://exoplanetarchive.ipac.caltech.edu/TAP/sync?${formatQuery(name, distance)}&format=json",
      ),
    );

    if (response.statusCode == 200) { // if retrieved successfully
      // parse and return data
      final planetData = json.decode(response.body);
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
