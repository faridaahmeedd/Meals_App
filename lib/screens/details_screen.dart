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
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation){
                return RotationTransition(
                  turns: Tween(
                    begin: 0.8,
                    end: 1.0,
                  ).animate(animation),
                  child: child,);
              },
              child: Icon (Icons.star,
                key: ValueKey(ref.read(favoritesProvider.notifier).state.contains(widget.meal)),
                color: ref.read(favoritesProvider.notifier).state.contains(widget.meal) == true
                    ? Colors.red
                    : Colors.white
              )
            )
          ),
        ],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Text(widget.meal.title),
              Hero(
                tag: widget.meal.id,
                  child: const Image(
                image: AssetImage('assets/burger.jpg'),
                height: 200,
                width: 250,
                fit: BoxFit.cover,
              )),
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
