import 'package:flutter/material.dart';
import 'package:wander/components/location_tile.dart';
import 'package:wander/model/category.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;
  final String userId;

  const CategoryScreen(
      {super.key, required this.category, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: category.locations.length,
        itemBuilder: (context, index) {
          return LocationTile(
            location: category.locations[index],
            userId: userId,
          );
        },
      ),
    );
  }
}
