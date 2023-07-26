import 'package:flutter/material.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../screens/meals_screen.dart';

class GridItem extends StatelessWidget {
  final Category category;
  final List<Meal> availableMeals;
  const GridItem({Key? key, required this.category, required this.availableMeals}) : super(key: key);

  void selectCategory(BuildContext context) {
    List<Meal> categoryMeals = [];
    print('Tapped ${category.title}');
    for(Meal meal in availableMeals){
      if (meal.categories.contains(category.id)){
        categoryMeals.add(meal);
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals: categoryMeals,)));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.5),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}