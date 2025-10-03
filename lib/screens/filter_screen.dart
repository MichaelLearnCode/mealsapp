import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerStatefulWidget {
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  @override
  Widget build(BuildContext context) {
    final currentFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: currentFilter[Filter.glutenFree]!,
            onChanged: (bool value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
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
            value: currentFilter[Filter.lactoseFree]!,
            onChanged: (bool value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
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
            value: currentFilter[Filter.vegetarian]!,
            onChanged: (bool value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
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
            value: currentFilter[Filter.vegan]!,
            onChanged: (bool value) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, value);
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
    );
  }
}
