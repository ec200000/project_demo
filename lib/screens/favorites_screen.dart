import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
  }
}
