import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({super.key, required this.meal});

  void selectMeal(BuildContext context) {
    print('MealItem: ${meal.title}');
    Navigator.push(context,
        MaterialPageRoute(builder: (ctx) => DetailsScreen(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            selectMeal(context);
          },
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
            // const FadeInImage(
                // placeholder: AssetImage('assets/burger.jpg'),
                // image: AssetImage('assets/burger.jpg'),
                // image: NetworkImage(meal.imageUrl),
                // height: 200,
                // width: double.infinity,
                // fit: BoxFit.cover,
                child: Image.network(meal.imageUrl,),
                // child:  FadeInImage(
                //     placeholder: const AssetImage('assets/burger.jpg'),
                //     image: NetworkImage(meal.imageUrl),
                //     height: 200,
                //     width: double.infinity,
                //   ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: 300,
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.schedule, color: Colors.white),
                              const SizedBox(width: 2),
                              Text('${meal.duration} min', style: const TextStyle(color: Colors.white),),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.work, color: Colors.white),
                              const SizedBox(width: 2),
                              Text(meal.complexityString, style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.attach_money, color: Colors.white,),
                              const SizedBox(width: 2),
                              Text(meal.affordabilityString, style: const TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
