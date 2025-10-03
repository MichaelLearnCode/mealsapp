import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

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

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>(
      (ref) => FavouriteMealsNotifier(),
    );
