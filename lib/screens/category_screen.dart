import 'package:flutter/material.dart';
import 'package:wander/components/location_tile.dart';
import 'package:wander/data/category_data.dart';

class CategoryScreen extends StatelessWidget {
  final CategoryData categoryData;

  const CategoryScreen({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryData.title),
      ),
      body: ListView.builder(
        itemCount: categoryData.locations.length,
        itemBuilder: (context, index) {
          return LocationTile(location: categoryData.locations[index]);
        },
      ),
    );
  }
}
