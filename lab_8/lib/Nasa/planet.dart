// the data model for a planet

import 'package:flutter/material.dart';

class Planet {
  final String name;
  //final? Image image;
  final String description;
  final int temp;

  Planet({required this.name, required this.description, required this.temp});
}