import 'package:flutter/material.dart';
import 'package:wander/data/location.dart';

class CategoryData {
  final IconData icon;
  final String title;
  final int totalPlaces;
  final int placesVisited;
  final List<Location> locations;

  CategoryData({
    required this.icon,
    required this.title,
    required this.totalPlaces,
    required this.placesVisited,
    required this.locations,
  });

  String get placesProgress => '$placesVisited/$totalPlaces';
}
