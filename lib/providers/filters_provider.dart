import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/models/meal.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterNotifier extends Notifier<Map<Filter, bool>> {
  @override
  Map<Filter, bool> build() => ({
    Filter.glutenFree: false,
    Filter.lactoseFree: false,
    Filter.vegan: false,
    Filter.vegetarian: false,
  });

  void setFilters(Map<Filter, bool> newFilter) {
    state = newFilter;
  }

  void setFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }
}

final filterProvider = NotifierProvider<FilterNotifier, Map<Filter, bool>>(
  FilterNotifier.new,
);

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);
  final currentFilter = ref.watch(filterProvider);
  final filteredMeals = meals.where((meal) {
    return currentFilter.values.every((value) => !value) ||
        (meal.isGlutenFree && currentFilter[Filter.glutenFree]!) ||
        (meal.isLactoseFree && currentFilter[Filter.lactoseFree]!) ||
        (meal.isVegan && currentFilter[Filter.vegan]!) ||
        (meal.isVegetarian && currentFilter[Filter.vegetarian]!);
  }).toList();
  return filteredMeals;
});
