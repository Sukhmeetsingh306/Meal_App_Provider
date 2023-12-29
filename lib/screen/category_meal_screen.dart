import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMealScreen extends StatefulWidget {
  static String routeName = '/category-Meals';

  final List<Meals> allMeals;

  const CategoryMealScreen(this.allMeals, {super.key});

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meals> categoryMeal;
  var _loadedDateDelete = false;

  @override
  void didChangeDependencies() {
    if (!_loadedDateDelete) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title']!;
      categoryMeal = widget.allMeals.where(
        (meal) {
          return meal.categoryId
              .contains(categoryId); // meal.categoryId is of the meals.dart
        },
      ).toList();
      _loadedDateDelete = true;
    }
    super.didChangeDependencies();
  }

  // void _removeMeal(String mealId) {
  //   setState(() {
  //     categoryMeal.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
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
