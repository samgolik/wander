import 'package:flutter/material.dart';
import 'package:wander/components/category_list.dart';
import 'package:wander/data/category_data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final categories = [
    CategoryData(
      icon: Icons.sports_baseball_outlined,
      title: 'MLB Stadiums',
      totalPlaces: 30,
      placesVisited: 3,
    ),
    CategoryData(
      icon: Icons.park_outlined,
      title: 'National Parks',
      totalPlaces: 63,
      placesVisited: 2,
    ),
    CategoryData(
      icon: Icons.airplanemode_active_outlined,
      title: 'Airports',
      totalPlaces: 5217,
      placesVisited: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: CategoryList(categories: categories),
    );
  }
}
