import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import './dummy_data.dart';
import './models/Meal.dart';
class CategoryItemScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryItemScreen(this.categoryId,this.categoryTitle);
  //categoryId =
  final categoryMeals = DUMMY_MEALS.where((meal)=> meal.categories!.contains(meal.id)).toList();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$categoryTitle Meals"),
      ),

      body: ListView.builder(
        itemBuilder:(context, index) {
          return Text((categoryMeals[index].affordability).toString());
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}