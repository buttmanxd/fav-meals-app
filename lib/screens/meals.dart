import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_details.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your favorite list is empty!!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Color.fromARGB(255, 97, 104, 103),
                  fontSize: 40,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try marking a dish as your favorite from the menu!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Color.fromARGB(255, 255, 0, 0),
                  fontSize: 20,
                ),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
