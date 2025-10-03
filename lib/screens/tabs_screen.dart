import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _currentIndex = 0;

  void _onNavigate(final index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onDrawerItemTap(String identifier) async {
    Navigator.pop(context);
    switch (identifier) {
      case 'meals':
        break;
      case 'filter':
        Navigator.push<Map<Filter, bool>>(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return FilterScreen();
            },
          ),
        );

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    Widget activeScreen = CategoriesScreen();
    var currentTitle = 'Categories';
    switch (_currentIndex) {
      case 0:
        activeScreen = CategoriesScreen();
        currentTitle = 'Categories';
        break;
      case 1:
        activeScreen = MealScreen(
          meals: favouriteMeals,
        );
        currentTitle = 'Favourite Meals';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
      ),
      drawer: MainDrawer(
        onDrawerItemTap: _onDrawerItemTap,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onNavigate,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
      body: activeScreen,
    );
  }
}
