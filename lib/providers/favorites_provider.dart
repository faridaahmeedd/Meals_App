import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavoritesNotifier extends StateNotifier <List<Meal>>{
  FavoritesNotifier() : super([]);

  bool toggleMealFavStatus(Meal meal){
   final isFav = state.contains(meal);

   if (isFav){
     state = state.where((m) => m.id != meal.id).toList();
     return false;
   }
   else{
     state = [...state, meal];
     return true;
   }
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier,List<Meal>>((ref) {
  return FavoritesNotifier();
});