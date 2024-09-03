import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals_screen.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(
    BuildContext context,
  ) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            const MealsScreen(title: 'some title',  meals: [])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: availableCategories
            .map(
              (category) => CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    _selectCategory(context);
                  }),
            )
            .toList(),
      ),
    );
  }
}
