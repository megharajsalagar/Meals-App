import 'package:flutter/material.dart';
import 'package:meals/Widgets/main_drawer.dart';
import 'package:meals/screens/categories_screen.dart';
import '../models/Meal.dart';
import './favourites_screen.dart';

class TabScreen extends StatefulWidget {
  final Function _toggelFavourites;
  final List<Meal> _favouriteMeals;
  const TabScreen(this._toggelFavourites,this._favouriteMeals);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meal"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Category",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favourite",
              ),
            ],
          ),
        ),
        drawer: MainDrawer(),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouriteScreen(widget._toggelFavourites,widget._favouriteMeals),
          ],
        ),
      ),
    );
  }
}
