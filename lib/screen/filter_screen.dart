import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filterScreen';

  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer:const MainDrawer(),
      body: const Center(
        child: Text('asd'),
      ),
    );
  }
}
