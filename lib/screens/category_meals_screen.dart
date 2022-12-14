import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/Widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/Meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> _availableMeals;
  CategoryMealsScreen(this._availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final categoryMeals = widget._availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
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
