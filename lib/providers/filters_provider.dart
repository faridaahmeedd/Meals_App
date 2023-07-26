import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<FilterType, bool>>((ref) {
  return FiltersNotifier();
}
);