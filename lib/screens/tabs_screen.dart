import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

final Map<Filter, bool> kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> _currentFilter = kInitialFilter;

  void _onNavigate(final index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _showNoti(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _onFavouriteTap(Meal meal) {
    if (_favouriteMeals.contains(meal)) {
      setState(() {
        _favouriteMeals.remove(meal);
        _showNoti('Meal removed from favourire');
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showNoti('Marked as favourite');
      });
    }
  }

  void _onDrawerItemTap(String identifier) async {
    Navigator.pop(context);
    switch (identifier) {
      case 'meals':
        break;
      case 'filter':
        final returnedFilter = await Navigator.push<Map<Filter, bool>>(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return FilterScreen(
                currentFilter: _currentFilter,
              );
            },
          ),
        );
        setState(() {
          _currentFilter = returnedFilter ?? kInitialFilter;
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeals = dummyMeals.where((meal) {
      return _currentFilter.values.every((value) => !value) ||
          (meal.isGlutenFree && _currentFilter[Filter.glutenFree]!) ||
          (meal.isLactoseFree && _currentFilter[Filter.lactoseFree]!) ||
          (meal.isVegan && _currentFilter[Filter.vegan]!) ||
          (meal.isVegetarian && _currentFilter[Filter.vegetarian]!);
    }).toList();

    Widget activeScreen = CategoriesScreen(
      onFavouriteTap: _onFavouriteTap,
      filteredMeals: filteredMeals,
    );
    var currentTitle = 'Categories';
    switch (_currentIndex) {
      case 0:
        activeScreen = CategoriesScreen(
          onFavouriteTap: _onFavouriteTap,
          filteredMeals: filteredMeals,
        );
        currentTitle = 'Categories';
        break;
      case 1:
        activeScreen = MealScreen(
          meals: _favouriteMeals,
          onFavouriteTap: _onFavouriteTap,
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
