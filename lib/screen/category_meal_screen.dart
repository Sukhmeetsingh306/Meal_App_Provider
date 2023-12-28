import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static String routeName = '/category-Meals';

  const CategoryMealScreen({super.key});

  // final String categoryId;
  // final String categoryTitle;

  // const CategoryMealsScreen(this.categoryId, this.categoryTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeal = DUMMY_MealS.where(
      (meal) {
        return meal.categoryId
            .contains(categoryId); // meal.categoryId is of the meals.dart
      },
    ).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              categoryMeal[index].id,
              categoryMeal[index].title,
              categoryMeal[index].imageUrl,
              categoryMeal[index].duration,
              categoryMeal[index].complexity,
              categoryMeal[index].affordability,
            );
          },
          itemCount: categoryMeal.length,
        ));
  }
}
