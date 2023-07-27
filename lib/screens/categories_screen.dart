import 'package:flutter/material.dart';
import '../data/categories_data.dart';
import '../models/meal.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoriesScreen({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: <Widget>[
          ...availableCategories
              .map((category) => GridItem(
                    category: category,
                    availableMeals: widget.availableMeals,
                  ))
              .toList(),
          //... is spread operator to convert list to individual items
        ]);
  }
}
