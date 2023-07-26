import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  final String title;

  const MealsScreen({Key? key, required this.title, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: title==null? null : AppBar(title: Text(title)),
      appBar: AppBar(title: Text(title)),
      body: meals.isEmpty
          ? const Center(
              child: Text('No meals found', style: TextStyle(fontSize: 19)),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(meal: meals[index]);
              },
              itemCount: meals.length,
            ),
    );
  }
}
