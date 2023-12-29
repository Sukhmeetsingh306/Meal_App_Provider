import 'package:flutter/material.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meals> favoriteMeal;
  const FavoriteScreen(this.favoriteMeal, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text('No Item Present'),
      );
    }else{
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              favoriteMeal[index].id,
              favoriteMeal[index].title,
              favoriteMeal[index].imageUrl,
              favoriteMeal[index].duration,
              favoriteMeal[index].complexity,
              favoriteMeal[index].affordability,
            );
          },
          itemCount: favoriteMeal.length,
        );
    }
  }
}
