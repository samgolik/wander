import 'package:flutter/material.dart';
import 'package:wander/components/category_card.dart';
import 'package:wander/model/category.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return SizedBox(
          width: double.infinity,
          child: CategoryCard(category: categories[index]),
        );
      },
    );
  }
}
