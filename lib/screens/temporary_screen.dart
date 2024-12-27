import 'package:flutter/material.dart';
import 'package:wander/model/category.dart';
import 'package:wander/model/location.dart';
import 'package:wander/services/category_service.dart';

class TemporaryScreen extends StatelessWidget {
  TemporaryScreen({super.key});

  final categories = [
    Category(
      icon: Icons.sports_baseball_outlined,
      title: 'MLB Stadiums',
      totalPlaces: 30,
      locations: [
        Location(title: 'American Family Field', visited: false),
        Location(title: 'Angel Stadium', visited: false),
        Location(title: 'Busch Stadium', visited: false),
        Location(title: 'Chase Field', visited: false),
        Location(title: 'Citi Field', visited: false),
        Location(title: 'Citizens Bank Park', visited: false),
        Location(title: 'Comerica Park', visited: false),
        Location(title: 'Coors Field', visited: false),
        Location(title: 'Dodger Stadium', visited: false),
        Location(title: 'Fenway Park', visited: false),
        Location(title: 'Globe Life Field', visited: false),
        Location(title: 'Great American Ball Park', visited: false),
        Location(title: 'Kauffman Stadium', visited: false),
        Location(title: 'loanDepot Park', visited: false),
        Location(title: 'Minute Maid Park', visited: false),
        Location(title: 'Nationals Park', visited: false),
        Location(title: 'Oakland Coliseum', visited: false),
        Location(title: 'Oracle Park', visited: false),
        Location(title: 'Oriole Park at Camden Yards', visited: false),
        Location(title: 'Petco Park', visited: false),
        Location(title: 'PNC Park', visited: false),
        Location(title: 'Progressive Field', visited: false),
        Location(title: 'Rogers Centre', visited: false),
        Location(title: 'T-Mobile Park', visited: false),
        Location(title: 'Target Field', visited: false),
        Location(title: 'Tropicana Field', visited: false),
        Location(title: 'Truist Park', visited: false),
        Location(title: 'Wrigley Field', visited: false),
        Location(title: 'Yankee Stadium', visited: false),
      ],
    ),
    // Category(
    //   icon: Icons.park_outlined,
    //   title: 'National Parks',
    //   totalPlaces: 63,
    //   locations: [],
    // ),
    // Category(
    //   icon: Icons.airplanemode_active_outlined,
    //   title: 'Airports',
    //   totalPlaces: 5217,
    //   locations: [],
    // ),
  ];

  void _saveCategory() {
    final categoryService = CategoryService();
    categoryService.saveUserCategories(categories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Temporary Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _saveCategory();
          },
          child: const Text('Add Category'),
        ),
      ),
    );
  }
}
