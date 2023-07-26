import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filtersProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.primary,
              value: filters[FilterType.gluten]!,
              onChanged: (newValue) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(FilterType.gluten, newValue);
              },
              title: const Text('Gluten-free'),
              subtitle: const Text('Only include gluten-free meals'),
              contentPadding: const EdgeInsets.only(left: 24, right: 24),
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.primary,
              value: filters[FilterType.lactose]!,
              onChanged: (newValue) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(FilterType.lactose, newValue);
              },
              title: const Text('Luctose-free'),
              subtitle: const Text('Only include luctose-free meals'),
              contentPadding: const EdgeInsets.only(left: 24, right: 24),
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.primary,
              value: filters[FilterType.vegetarian]!,
              onChanged: (newValue) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(FilterType.vegetarian, newValue);
              },
              title: const Text('Vegetarian'),
              subtitle: const Text('Only include Vegeterian meals'),
              contentPadding: const EdgeInsets.only(left: 24, right: 24),
            ),
            SwitchListTile(
              activeColor: Theme.of(context).colorScheme.primary,
              value: filters[FilterType.vegan]!,
              onChanged: (newValue) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(FilterType.vegan, newValue);
              },
              title: const Text('Vegan'),
              subtitle: const Text('Only include vegan meals'),
              contentPadding: const EdgeInsets.only(left: 24, right: 24),
            ),
          ],
        ));
  }
}
