import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridList extends StatefulWidget {
  const CategoryGridList({super.key, required this.categories});
  final List<Category> categories;

  @override
  State<CategoryGridList> createState() => _CategoryGridListState();
}

class _CategoryGridListState extends State<CategoryGridList> {
  @override
  Widget build(BuildContext context) {
    // final renderedItems = widget.categories.map((category)=>CategoryGridItem(category: category)).toList();
    return ListView.builder(
      itemCount: widget.categories.length,
      itemBuilder: (ctx, index) {
        return CategoryGridItem(category: widget.categories[index]);
      },
    );
  }
}
