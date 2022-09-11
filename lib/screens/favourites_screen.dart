import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../Widgets/meal_item.dart';
import '../models/Meal.dart';

class FavouriteScreen extends StatelessWidget {
  final Function _toggelFavourites;
  final List<Meal> _favouriteMeals;
  const FavouriteScreen(this._toggelFavourites, this._favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _favouriteMeals.isEmpty
          ? Center(
              child: Text("Favourites are not added yet!"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return MealItem(
                    title: _favouriteMeals[index].title,
                    id: _favouriteMeals[index].id,
                    imageUrl: _favouriteMeals[index].imageUrl,
                    duration: _favouriteMeals[index].duration,
                    complexity: _favouriteMeals[index].complexity,
                    affordability: _favouriteMeals[index].affordability);
              },
              itemCount: _favouriteMeals.length,
            ),
    );
  }
}
