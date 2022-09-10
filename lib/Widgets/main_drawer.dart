import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  //const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(BuildContext context,String title, IconData icon, String tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: ()=> Navigator.of(context).pushReplacementNamed(tapHandler),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up!",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
          ),

          SizedBox(
            height: 20,
          ),

          buildListTile(context,"Meals", Icons.restaurant,"/"),

          buildListTile(context,"Filters", Icons.settings,FiltersScreen.routeName),
        ],
      ),
    );
  }
}
