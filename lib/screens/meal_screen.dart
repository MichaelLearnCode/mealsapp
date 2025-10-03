import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<Meal> meals;

  void onMealTap(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealDetailsScreen(meal: meal),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget renderedScreen = meals.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Uh oh..., no meals found',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: Colors.white),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onMealTap: () {
                onMealTap(context, meals[index]);
              },
            ),
          );
    if (title == null) {
      return renderedScreen;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: renderedScreen,
    );
  }
}
