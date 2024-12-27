import 'package:flutter/material.dart';
import 'package:wander/components/category_list.dart';
import 'package:wander/components/nav_bar.dart';
import 'package:wander/model/category.dart';
import 'package:wander/model/user.dart';
import 'package:wander/services/category_service.dart';
import 'package:wander/services/user_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late User currentUser;
  late List<Category> selectedCategories = [];

  final CategoryService categoryService = CategoryService();

  @override
  void initState() {
    _getCurrentUser();
    _getCategories();
    super.initState();
  }

  void _getCategories() async {
    categoryService.fetchUserCategories().then((categories) {
      setState(() {
        selectedCategories = categories;
      });
    });
  }

  void _getCurrentUser() async {
    final userService = UserService();
    final currentUser = await userService.getUser();
    setState(() {
      this.currentUser = currentUser!;
    });
  }

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: NavBar(
        currentIndex: _currentIndex,
        onTap: _onNavBarTap,
      ),
      body: CategoryList(categories: selectedCategories),
    );
  }
}
