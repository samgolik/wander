import 'package:flutter/material.dart';
import 'package:wander/model/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6, // Adds shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shadowColor: Colors.black.withOpacity(0.2), // Subtle shadow
      child: InkWell(
        borderRadius:
            BorderRadius.circular(12), // Rounded corners for tap effect
        onTap: () {
          Navigator.of(context).pushNamed(
            '/category',
            arguments: category,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    category.icon,
                    size: 32, // Slightly larger icon
                    color: Theme.of(context).primaryColor, // Matches theme
                  ),
                  const SizedBox(width: 12),
                  Text(
                    category.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87, // Darker text color
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Placeholder',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Accent color
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
