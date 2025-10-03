import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteMeals extends Notifier<List<Meal>> {
  @override
  List<Meal> build() => [];
  bool toggleFavouriteMeal(Meal meal) {
    final isFavourited = state.contains(meal);

    if (!isFavourited) {
      state = [...state, meal];
    } else {
      final List<Meal> newFavouriteMeals = state
          .where((meal) => meal != meal)
          .toList();
      state = newFavouriteMeals;
    }
    return isFavourited;
  }
}

final favouriteMealsProvider = NotifierProvider<FavouriteMeals, List<Meal>>(
  FavouriteMeals.new,
);
