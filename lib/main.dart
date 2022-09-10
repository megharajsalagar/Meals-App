import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';

import 'screens/categories_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './models/Meal.dart';
import '';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Map<String,bool> _filters ={
    'Gluten':false,
    'Lactose':false,
    'Vegan':false,
    'Vegitarian':false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void Function()? _setFilters(Map<String,bool> _filterData){
      setState(() {
        _filters =_filterData;
        _availableMeals = DUMMY_MEALS.where((meal){
            if(_filters['Gluten']!=null  && !meal.isGlutenFree){
              return false;
            }
             if(_filters['Lactose']!=null  && !meal.isLactoseFree){
              return false;
            }      
             if(_filters['Vegan']!=null  && !meal.isVegan){
              return false;
            }      
             if(_filters['Vegitarian']!=null  && !meal.isVegetarian){
              return false;
            }
            return true;           
        }).toList();
      });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleSmall: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ))),
      //home: TabScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName:(context)=>FiltersScreen(_filters,_setFilters)
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => CategoriesScreen(),
      ),
    );
  }
}
