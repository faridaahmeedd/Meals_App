import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  final Meal meal;

  const DetailsScreen({Key? key, required this.meal}) : super(key: key);

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  Widget build(BuildContext context) {
    var isFav = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFav = ref
                    .read(favoritesProvider.notifier)
                    .toggleMealFavStatus(widget.meal);
              });
            },
            icon: ref.read(favoritesProvider.notifier).state.contains(widget.meal) == true
                ? const Icon(Icons.star, color: Colors.red)
                : const Icon(Icons.star, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Text(widget.meal.title),
              const Image(
                image: AssetImage('assets/burger.jpg'),
                height: 200,
                width: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Text('Ingredients',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      )),
              for (var ingredient in widget.meal.ingredients)
                Text(
                  ingredient,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              const SizedBox(height: 10),
              Text('Steps',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      )),
              for (var i = 0; i < widget.meal.steps.length; i++)
                ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 20,
                      child: Text('# ${i + 1}',
                          style: const TextStyle(color: Colors.white))),
                  title: Text(
                    widget.meal.steps[i],
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                    textAlign: TextAlign.justify,
                  ),
                ),
            ],
          )),
    );
  }
}
