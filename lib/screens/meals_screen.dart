import 'package:flutter/material.dart';
import 'package:meals/model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {

 Widget content = Center(child: Column(
  mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
   Text('Uh oh, no content here', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer)),
  const SizedBox(height: 20),
  Text('Try selecting a different category!', 
  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),),
],),);

if (meals.isNotEmpty){
 content = ListView.builder(itemBuilder: (ctx, index) => 
        Text(meals[index].title),
      );
}

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content
    );
  }
}