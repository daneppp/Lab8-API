// the data model for a planet

class Planet {
  final String? name;
  final double? orbitPeriod;
  final double? distanceFromEarth;
  final double? mass;
  final double? radius;
  final String? host;

  Planet({required this.orbitPeriod, required this.distanceFromEarth, required this.mass, required this.radius, required this.host, required this.name});
}