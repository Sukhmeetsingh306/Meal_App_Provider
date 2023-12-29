import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

// ignore: must_be_immutable
class FilterScreen extends StatefulWidget {
  static const routeName = '/filterScreen';

  final Function setFilters;
  Map<String, bool> currentFilters;

  FilterScreen(this.currentFilters, this.setFilters, {super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget expandedAction(
      bool variable, String text, String subText, Function(bool)? update) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Expanded(
        child: ListView(
          children: <Widget>[
            SwitchListTile(
              value: (variable),
              onChanged: update,
              title: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              subtitle: Text(subText),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilter = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
              };
              widget.setFilters(selectedFilter);
            },
            icon: const Icon(
              Icons.save_rounded,
            ),
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "Adjust As Per Requirement",
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          expandedAction(
              _glutenFree, "Gluten Free", 'Only Select For Gluten Free',
              (newValue) {
            setState(() {
              _glutenFree = newValue;
            });
          }),
          expandedAction(
              _lactoseFree, 'Lactose Free', 'Only Select For Lactose Free',
              (newValue) {
            setState(() {
              _lactoseFree = newValue;
            });
          }),
          expandedAction(_vegan, 'Vegan', 'Only Select For Vegan', (newValue) {
            setState(() {
              _vegan = newValue;
            });
          }),
          expandedAction(
              _vegetarian, 'Vegetarian', 'Only Select For Vegetarian',
              (newValue) {
            setState(() {
              _vegetarian = newValue;
            });
          }),
        ],
      ),
    );
  }
}
