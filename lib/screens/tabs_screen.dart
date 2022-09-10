import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import './favourites_screen.dart';
class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

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
        drawer: Drawer(elevation: 5,child: Text("Drawer Page!"),),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavouriteScreen(),
          ],
        ),
      ),
    );
  }
}