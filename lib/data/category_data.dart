import 'package:flutter/material.dart';

class CategoryData {
  final IconData icon;
  final String title;
  final int totalPlaces;
  final int placesVisited;

  CategoryData({
    required this.icon,
    required this.title,
    required this.totalPlaces,
    required this.placesVisited,
  });

  String get placesProgress => '$placesVisited/$totalPlaces';
}
