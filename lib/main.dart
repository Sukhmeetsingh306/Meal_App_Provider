import 'package:flutter/material.dart';

import '../models/dummy_data.dart';
import '../models/meals.dart';
import '../screen/filter_screen.dart';
import '../screen/tab_screen.dart';
import '../screen/meal_detail_screen.dart';
import '../screen/category_screen_list.dart';
import '../screen/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Meals> _allMeals = DUMMY_MealS;
  final List<Meals> _favoriteMeal = [];

  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filter = filterData;

      _allMeals = DUMMY_MealS.where((meal) {
        if (_filter['gluten']! && !meal.glutenFree) {
          return false;
        }
        if (_filter['lactose']! && !meal.lactoseFree) {
          return false;
        }
        if (_filter['vegan']! && !meal.vegan) {
          return false;
        }
        if (_filter['vegetarian']! && !meal.vegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavoriteMeal(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere(
      (meal) => meal.id == mealId,
    );
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(
          DUMMY_MealS.firstWhere(
            (meal) => meal.id == mealId,
          ),
        );
      });
    }
  }

  bool _isMealFav(String id) {
    return _favoriteMeal.any(
      (meal) => meal.id == id,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
      ),
      home: TabScreen(_favoriteMeal),
      routes: {
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_allMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavoriteMeal, _isMealFav),
        FilterScreen.routeName: (context) => FilterScreen(_filter, _setFilter),
      },
      // onGenerateRoute: (settings) {
      //   if(settings.name == MealDetailScreen.routeName){
      //     return MaterialPageRoute(builder: (context){
      //       return const MealDetailScreen();
      //     });
      //   }
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoryScreenList(),
        );
      },
    );
  }
}
