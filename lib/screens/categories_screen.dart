import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/filters_provider.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  void _onCategoryTap(
    BuildContext context,
    Category category,
    List<Meal> filteredMeals,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealScreen(
          title: category.title,
          meals: filteredMeals
              .where((meal) => meal.categories.contains(category.id))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onCategoryTap: () {
                _onCategoryTap(context, category, filteredMeals);
              },
            ),
        ],
      ),
    );
  }
}
