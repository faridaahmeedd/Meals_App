import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/meals_data.dart';

enum FilterType { gluten, lactose, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<FilterType, bool>> {
  FiltersNotifier() : super({
    FilterType.gluten: false,
    FilterType.lactose: false,
    FilterType.vegetarian: false,
    FilterType.vegan: false
  });

  void setFilter(FilterType filter, bool isActivated) {
    state = {
      ...state,
      filter: isActivated};
  }

  void setAllFilters(Map<FilterType, bool> filters) {
    state = filters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier,
    Map<FilterType, bool>>((ref) {
  return FiltersNotifier();
});

final filteredMealsProvider = Provider((ref) {
    final filters = ref.watch(filtersProvider);   //whenever filtersProvider is changed this function is re-executed
    return dummyMeals.where((meal) {
      if (filters[FilterType.gluten]! && (meal.isGlutenFree != filters[FilterType.gluten])) {
        return false;
      }
      if (filters[FilterType.lactose]! && (meal.isLactoseFree != filters[FilterType.lactose])) {
        return false;
      }
      if (filters[FilterType.vegetarian]! && (meal.isVegetarian != filters[FilterType.vegetarian])) {
        return false;
      }
      if (filters[FilterType.vegan]! && (meal.isVegan != filters[FilterType.vegan])) {
        return false;
      }
      return true;
    }).toList();
});