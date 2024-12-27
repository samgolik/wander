import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wander/model/location.dart';

class Category {
  final IconData icon;
  final String title;
  final int totalPlaces;
  final List<Location> locations;

  Category({
    required this.icon,
    required this.title,
    required this.totalPlaces,
    required this.locations,
  });

  /// Convert Category to Firestore data
  Map<String, dynamic> toFirestore() {
    return {
      'icon': icon.codePoint,
      'title': title,
      'totalPlaces': totalPlaces,
      'locations': locations.map((location) => location.toFirestore()).toList(),
    };
  }

  /// Create Category from Firestore data
  factory Category.fromFirestore(Map<String, dynamic> data) {
    return Category(
      icon: IconData(data['icon'], fontFamily: 'MaterialIcons'),
      title: data['title'] ?? '',
      totalPlaces: data['totalPlaces'] ?? 0,
      locations: (data['locations'] as List<dynamic>?)
              ?.map((locationData) => Location.fromFirestore(locationData))
              .toList() ??
          [],
    );
  }

  Future<void> saveCategory(Category category) async {
    CollectionReference categories =
        FirebaseFirestore.instance.collection('categories');

    await categories.doc(category.title).set(category.toFirestore());
  }

  Future<List<Category>> fetchCategories() async {
    CollectionReference categories =
        FirebaseFirestore.instance.collection('categories');
    QuerySnapshot querySnapshot = await categories.get();

    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return Category.fromFirestore(data);
    }).toList();
  }
}
