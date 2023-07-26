import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/filters_provider.dart';
import '../models/meal.dart';
import '../screens/filters_screen.dart';
import '../screens/meals_screen.dart';

import 'categories_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;
  List<Meal> availableMeals = [];

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favMeals = ref.watch(favoritesProvider);
    final filteredMeals = ref.watch(filteredMealsProvider);
    // var activePage = selectedPageIndex == 0
    //     ? CategoriesScreen()
    //     : MealsScreen(meals: favoriteMeals);
    // var activeTitle = selectedPageIndex == 0 ? 'Categories' : 'Favorites';
    return Scaffold(
      drawerEdgeDragWidth: 0,
      appBar: AppBar(title: const Text('Categories')),
      // drawerWidth: 250,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Drawer(
          child: Column(
            children: [
              AppBar(
                title: const Text('Menu'),
                backgroundColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.9),
              ),
              ListTile(
                leading: const Icon(Icons.restaurant),
                title: const Text('Categories'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.star),
                title: const Text('Favorites'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => MealsScreen(
                                meals: favMeals,
                                title: 'Favorites',
                              )));
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Filters'),
                onTap: () async {
                  Navigator.pop(context);
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      body: CategoriesScreen(availableMeals: filteredMeals,),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedPageIndex,
      //   onTap: (index) {
      //     print('index: $index');
      //     selectPage(index);
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.category),
      //       label: 'Categories',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.star),
      //       label: 'Favorites',
      //     ),
      //   ],
      // )
      // )
    );
  }
}
