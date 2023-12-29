import 'package:flutter/material.dart';

import '../widgets/drawer.dart';
import '../screen/category_screen_list.dart';
import '../models/meals.dart';
import '../screen/fav_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meals> favoriteMeal;

  const TabScreen(this.favoriteMeal, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': const CategoryScreenList(),
        'title': 'Category',
      },
      {
        'page': FavoriteScreen(widget.favoriteMeal),
        'title': 'Favorite',
      },
    ];
    super.initState();
  }

  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectPageIndex]['title']),
      ),
      drawer: const MainDrawer(),
      body: _pages[_selectPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black38,
        selectedItemColor: const Color.fromARGB(255, 166, 161, 35),
        currentIndex: _selectPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_rounded,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_outlined,
            ),
            label: 'Favorite',
          ),
        ],
      ),
    );
  }
}
