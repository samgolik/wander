import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wander/model/category.dart';
import 'package:wander/services/user_service.dart';

class CategoryService {
  UserService userService = UserService();

  Future<List<Category>> fetchAllCategories() async {
    final categoriesSnapshot =
        await FirebaseFirestore.instance.collection('categories').get();

    return categoriesSnapshot.docs.map((doc) {
      final data = doc.data();
      return Category.fromFirestore(data);
    }).toList();
  }

  Future<List<Category>> fetchUserCategories() async {
    final currentUser = await userService.getUser();
    if (currentUser == null) {
      throw Exception('User not found');
    }

    final userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();

    if (!userSnapshot.exists) {
      throw Exception('User document not found');
    }

    final data = userSnapshot.data();
    if (data == null || data['categories'] == null) {
      throw Exception('User has no selected categories');
    }

    final selectedCategoryData = data['categories'] as List<dynamic>;
    return selectedCategoryData
        .map((categoryData) => Category.fromFirestore(categoryData))
        .toList();
  }

  void saveUserCategories(List<Category> categories) async {
    final currentUser = await userService.getUser();
    if (currentUser == null) {
      throw Exception('User not found');
    }

    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

    // Save user categories with their visited locations
    await userDoc.set({
      'categories': categories.map((category) {
        // Convert each category to Firestore data
        final categoryData = category.toFirestore();

        // Update visited status of locations in the category
        categoryData['locations'] = category.locations.map((location) {
          return {
            'title': location.title,
            'visited':
                location.visited, // Ensure the visited status is included
          };
        }).toList();

        return categoryData;
      }).toList(),
    }, SetOptions(merge: true));
  }
}
