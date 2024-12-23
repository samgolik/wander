import 'package:flutter/material.dart';
import 'package:wander/components/category_list.dart';
import 'package:wander/data/category_data.dart';
import 'package:wander/data/location.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final categories = [
    CategoryData(
      icon: Icons.sports_baseball_outlined,
      title: 'MLB Stadiums',
      totalPlaces: 30,
      placesVisited: 3,
      locations: [
        Location(title: 'American Family Field'),
        Location(title: 'Angel Stadium'),
        Location(title: 'Busch Stadium'),
        Location(title: 'Chase Field'),
        Location(title: 'Citi Field'),
        Location(title: 'Citizens Bank Park'),
        Location(title: 'Comerica Park'),
        Location(title: 'Coors Field'),
        Location(title: 'Dodger Stadium'),
        Location(title: 'Fenway Park'),
        Location(title: 'Globe Life Field'),
        Location(title: 'Great American Ball Park'),
        Location(title: 'Kauffman Stadium'),
        Location(title: 'loanDepot Park'),
        Location(title: 'Minute Maid Park'),
        Location(title: 'Nationals Park'),
        Location(title: 'Oakland Coliseum'),
        Location(title: 'Oracle Park'),
        Location(title: 'Oriole Park at Camden Yards'),
        Location(title: 'Petco Park'),
        Location(title: 'PNC Park'),
        Location(title: 'Progressive Field'),
        Location(title: 'Rogers Centre'),
        Location(title: 'T-Mobile Park'),
        Location(title: 'Target Field'),
        Location(title: 'Tropicana Field'),
        Location(title: 'Truist Park'),
        Location(title: 'Wrigley Field'),
        Location(title: 'Yankee Stadium'),
      ],
    ),
    CategoryData(
      icon: Icons.park_outlined,
      title: 'National Parks',
      totalPlaces: 63,
      placesVisited: 2,
      locations: [],
    ),
    CategoryData(
      icon: Icons.airplanemode_active_outlined,
      title: 'Airports',
      totalPlaces: 5217,
      placesVisited: 10,
      locations: [],
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
