import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymealsapp_ue204085/providers/favourite_meals_provider.dart';
import 'package:mymealsapp_ue204085/utils/snack_bar.dart';

import '../models/meal.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isFavourite = favouriteMeals.contains(meal);
    return Scaffold(
        appBar: AppBar(title: Text(meal.title), actions: [
          IconButton(
            onPressed: () {
              final favouriteMealsNotifier =
                  ref.read(favouriteMealsProvider.notifier);
              final isAdded =
                  favouriteMealsNotifier.toggleMealFavouriteStatus(meal);
              showSnackBar(
                  context,
                  isAdded
                      ? '${meal.title} is added to favourites '
                      : '${meal.title} is removed from favourites ');
            },
            icon: Icon(isFavourite ? Icons.star : Icons.star_border),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 14),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Color.fromARGB(255, 254, 0, 140),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final ingredient in meal.ingredients)
                Text(
                  ingredient,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Color.fromARGB(255, 0, 236, 204),
                        fontSize: 30,
                      ),
                ),
              const SizedBox(height: 24),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Color.fromARGB(255, 254, 0, 140),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 14),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(
                    step,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Color.fromARGB(255, 0, 236, 204),
                          fontSize: 30,
                        ),
                  ),
                ),
            ],
          ),
        ));
  }
}
