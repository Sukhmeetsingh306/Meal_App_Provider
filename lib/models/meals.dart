// ignore_for_file: constant_identifier_names

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meals {
  final String id;
  final List<String> categoryId;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool vegetarian;
  final bool glutenFree;
  final bool lactoseFree;
  final bool vegan;

  const Meals({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.glutenFree,
    required this.lactoseFree,
    required this.vegan,
    required this.vegetarian,
  });
}
