import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});
  final Map<Filter, bool> currentFilter;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _setGlutenFree = false;
  bool _setLactoseFree = false;
  bool _setVegetarian = false;
  bool _setVegan = false;

  @override
  void initState() {
    super.initState();
    _setGlutenFree = widget.currentFilter[Filter.glutenFree]!;
    _setLactoseFree = widget.currentFilter[Filter.lactoseFree]!;
    _setVegetarian = widget.currentFilter[Filter.vegetarian]!;
    _setVegan = widget.currentFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _setGlutenFree,
            Filter.lactoseFree: _setLactoseFree,
            Filter.vegetarian: _setVegetarian,
            Filter.vegan: _setVegan,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _setGlutenFree,
              onChanged: (bool value) {
                setState(() {
                  _setGlutenFree = value;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Colors.white),
              ),
            ),
            SwitchListTile(
              value: _setLactoseFree,
              onChanged: (bool value) {
                setState(() {
                  _setLactoseFree = value;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Colors.white),
              ),
            ),
            SwitchListTile(
              value: _setVegetarian,
              onChanged: (bool value) {
                setState(() {
                  _setVegetarian = value;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Colors.white),
              ),
            ),
            SwitchListTile(
              value: _setVegan,
              onChanged: (bool value) {
                setState(() {
                  _setVegan = value;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
