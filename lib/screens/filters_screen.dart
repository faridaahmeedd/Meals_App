import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenValue = false; 
  bool _lactoseValue = false;
  bool _vegetarianValue = false;
  bool _veganValue = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenValue = activeFilters[FilterType.gluten]!;
    _lactoseValue = activeFilters[FilterType.lactose]!;
    _vegetarianValue = activeFilters[FilterType.vegetarian]!;
    _veganValue = activeFilters[FilterType.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(filtersProvider.notifier).setAllFilters( {
          FilterType.gluten: _glutenValue,
          FilterType.lactose: _lactoseValue,
          FilterType.vegetarian: _vegetarianValue,
          FilterType.vegan: _veganValue,
        });
        return true; // return false to prevent the screen from being popped automatically
      },
      child: Scaffold(
          appBar: AppBar(
            title:const Text('Filters'),
          ),
          body: Column(
            children: [
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.primary,
                value: _glutenValue,
                onChanged: (newValue) {
                  setState(() {
                    _glutenValue = newValue;
                  });
                },
                title: const Text('Gluten-free'),
                subtitle: const Text('Only include gluten-free meals'),
                contentPadding: const EdgeInsets.only(left: 24, right: 24),
              ),
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.primary,
                value: _lactoseValue,
                onChanged: (newValue) {
                  setState(() {
                    _lactoseValue = newValue;
                  });
                },
                title: const Text('Luctose-free'),
                subtitle: const Text('Only include luctose-free meals'),
                contentPadding: const EdgeInsets.only(left: 24, right: 24),
              ),
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.primary,
                value: _vegetarianValue,
                onChanged: (newValue) {
                  setState(() {
                    _vegetarianValue = newValue;
                  });
                },
                title: const Text('Vegetarian'),
                subtitle: const Text('Only include Vegeterian meals'),
                contentPadding: const EdgeInsets.only(left: 24, right: 24),
              ),
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.primary,
                value: _veganValue,
                onChanged: (newValue) {
                  setState(() {
                    _veganValue = newValue;
                  });
                },
                title: const Text('Vegan'),
                subtitle: const Text('Only include vegan meals'),
                contentPadding: const EdgeInsets.only(left: 24, right: 24),
              ),
            ],
          )),
    );
  }
}
