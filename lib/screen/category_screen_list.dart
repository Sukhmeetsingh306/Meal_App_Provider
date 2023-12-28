import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../models/dummy_data.dart';

class CategoryScreenList extends StatelessWidget {
  const CategoryScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView(
          padding: const EdgeInsets.all(25),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2 /*1.5*/,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ),
              )
              .toList()),
    );
  }
}
