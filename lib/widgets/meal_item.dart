import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/widgets/meal_status.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onMealTap});
  final Meal meal;
  final void Function() onMealTap;

  @override
  Widget build(BuildContext context) {
    final mealComplexity =
        meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
    final mealAffordability =
        meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);

    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onMealTap,
        child: Stack(
          children: [
            FadeInImage(
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 44,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        meal.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealStatus(
                            icon: Icons.lock_clock_outlined,
                            label: '${meal.duration} min',
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          MealStatus(
                            icon: Icons.luggage,
                            label: mealComplexity,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          MealStatus(
                            icon: Icons.money,
                            label: mealAffordability,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
