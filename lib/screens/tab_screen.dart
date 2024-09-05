import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/model/meal.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _changeScreens(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleMealFavoriteStatus(Meal meal) {
 final isExisting = _favoriteMeals.contains(meal);
 if (isExisting) {
  _favoriteMeals.remove(meal);
 } else {
  _favoriteMeals.add(meal);
 }
  }

  @override
  Widget build(BuildContext context) {
      var activeScreenTitle = 'Categories';

    Widget activeScreen = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus);
    if (_selectedPageIndex == 1) {
      activeScreen = MealsScreen(meals: [], onToggleFavorite: _toggleMealFavoriteStatus,);
      activeScreenTitle = 'Favorites';
    } 

    return Scaffold(
      appBar: AppBar(title: Text(activeScreenTitle)),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _changeScreens,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
