import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/Widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/Meal.dart';

class CategoryItemScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryItemScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories!.contains(categoryId);
    }).toList();

    //print(categoryMeals.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle Meals"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              title: categoryMeals[index].title,
              id: categoryMeals[index].id,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
