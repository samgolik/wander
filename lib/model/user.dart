import 'package:wander/model/category.dart';

class User {
  final String uid;
  final String email;
  final List<Category> selectedCategories;
  final Map<String, List<String>> visitedLocations;

  User({
    required this.uid,
    required this.email,
    required this.selectedCategories,
    required this.visitedLocations,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'selectedCategories':
          selectedCategories.map((category) => category.toFirestore()).toList(),
      'visitedLocations': visitedLocations,
    };
  }

  factory User.fromFirestore(Map<String, dynamic> data, String uid) {
    return User(
      uid: uid,
      email: data['email'] ?? '',
      selectedCategories: (data['selectedCategories'] as List<dynamic>?)
              ?.map((categoryData) => Category.fromFirestore(categoryData))
              .toList() ??
          [],
      visitedLocations: (data['visitedLocations'] as Map<String, dynamic>?)
              ?.map((key, value) =>
                  MapEntry(key, List<String>.from(value as List<dynamic>))) ??
          {},
    );
  }
}
