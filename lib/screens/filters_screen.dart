import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static final routeName = '/filters';
  void Function(Map<String,bool>)? saveFilters;
  Map<String,bool> _filters ;
  FiltersScreen(this._filters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;

  bool _isLactoseFree = false;

  bool _isVegan = false;

  bool _isVegetarian = false;

@override
void initState() {
    // TODO: implement initState
    _isGlutenFree = widget._filters['Gluten'] as bool;
    _isLactoseFree = widget._filters['Lactose'] as bool;
    _isVegan = widget._filters['Vegan'] as bool;
    _isVegetarian = widget._filters['Vegitarian'] as bool;
    super.initState();
  }
  Widget buildSwitchListTile(String title, String subtitle, bool value,
      void Function(bool)? setValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: setValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(onPressed:(){
              final selectedFilters={
                 'Gluten':_isGlutenFree,
                  'Lactose':_isLactoseFree,
                  'Vegan':_isVegan,
                  'Vegitarian':_isVegetarian
              };
              widget.saveFilters!(selectedFilters);
              }, icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten Free',
                    'Only include gluten-free meals',
                    _isGlutenFree, (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose Free',
                    'Only include lactose-free meals',
                    _isLactoseFree, (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', 'Only include vegan meals', _isVegan, (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                }),
                buildSwitchListTile('Vegitarian',
                    'Only include vegitarian meals', _isVegetarian, (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
