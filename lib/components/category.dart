import 'package:flutter/material.dart';
import 'package:wander/data/category_data.dart';

class Category extends StatelessWidget {
  final CategoryData categoryData;

  const Category({super.key, required this.categoryData});

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
          // Handle the tap event
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    categoryData.icon,
                    size: 32, // Slightly larger icon
                    color: Theme.of(context).primaryColor, // Matches theme
                  ),
                  const SizedBox(width: 12),
                  Text(
                    categoryData.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87, // Darker text color
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                categoryData.placesProgress,
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
