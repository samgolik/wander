import 'package:flutter/material.dart';
import 'package:wander/components/category.dart';
import 'package:wander/data/category_data.dart';

class CategoryList extends StatelessWidget {
  final List<CategoryData> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: double.infinity,
          child: Category(categoryData: categories[index]),
        );
      },
    );
  }
}
