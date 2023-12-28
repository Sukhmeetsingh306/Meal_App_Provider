import 'package:flutter/material.dart';

import '../screen/category_meal_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String titleItem;
  final Color colorItem;

  const CategoryItem(this.id, this.titleItem, this.colorItem, {super.key});

  void selectCategory(BuildContext cyx) {
    // Navigator.of(cyx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id, titleItem);
    //     },
    //   ),
    // );
    Navigator.of(cyx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {'id': id, 'title': titleItem},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorItem.withOpacity(0.7),
              colorItem,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          titleItem,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: 'RobotoCondensed'),
        ),
      ),
    );
  }
}
