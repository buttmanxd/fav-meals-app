import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mymealsapp_ue204085/data/dummy_data.dart';
import 'package:mymealsapp_ue204085/enums%20and%20extensions/all.dart';
import 'package:mymealsapp_ue204085/providers/filters_provider.dart';

final filteredMealsProvider = Provider((ref) {
  final filters = ref.watch(filtersProvider);
  return dummyMeals.where(
    (element) {
      if (filters[Filter.glutenFree]! && !element.isGlutenFree) return false;
      if (filters[Filter.lactoseFree]! && !element.isLactoseFree) return false;
      if (filters[Filter.vegetarian]! && !element.isVegetarian) return false;
      if (filters[Filter.vegan]! && !element.isVegan) return false;
      return true;
    },
  ).toList();
});
