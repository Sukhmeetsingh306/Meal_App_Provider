import 'package:flutter/material.dart';
import 'package:meals_app/screen/filter_screen.dart';

import './screen/tab_screen.dart';
import './screen/meal_detail_screen.dart';
import './screen/category_screen_list.dart';
import './screen/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const TabScreen(),
      routes: {
        CategoryMealScreen.routeName: (context) => const CategoryMealScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FilterScreen.routeName: (context) => const FilterScreen(),
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
