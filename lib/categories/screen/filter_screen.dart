import 'package:flutter/material.dart';
import 'package:second1/categories/widget/main_drawer.dart';
class Filter_Screen extends StatefulWidget{
  static const routName = ('/filter');
  final Function filter;
  final Map<String, bool> newMap;
  Filter_Screen(this.newMap,this.filter);

  @override
  _Filter_ScreenState createState() => _Filter_ScreenState();
}

class _Filter_ScreenState extends State<Filter_Screen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  // initState(){
  //   _glutenFree=widget.newMap.containsKey('gluten');
  //   _lactoseFree =widget.newMap.containsKey('lactose');
  //   _vegan=widget.newMap.containsKey('vegan');
  //   _vegetarian=widget.newMap.containsKey('vegatalian');
  //   super.initState();
  // }
    void initState() {
      _glutenFree = widget.newMap['gluten']??=false;
     _lactoseFree = widget.newMap['lactose']??=false;
     _vegetarian = widget.newMap['vegatalian']??=false;
     _vegan = widget.newMap['vegan']??=false;   
     
 
     super.initState();
   }
  Widget switchTileList (String title, String description, bool curentValue,dynamic switchOn){
    return SwitchListTile(title:Text(title),subtitle: Text(description), value : curentValue, onChanged: switchOn,);
             
  }
  Widget build (BuildContext context){
    return Scaffold(appBar: AppBar( title:Text('filter'), actions: [
      IconButton(onPressed:(){
        final mySelectedFilter = {
'gluten':_glutenFree,
    'lactose':_lactoseFree,
    'vegan':_vegan,
    'vegatalian':_vegetarian,
        };
widget.filter(mySelectedFilter);

      } , icon: Icon(Icons.save))
    ],),
    drawer: DrawerMain(),
    body: Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text('adjust your meal selection',
          style: Theme.of(context).textTheme.title),
          ),
        Expanded(child: ListView(
          children: [
            switchTileList('gluten-free', 'only include gluten-free meal', _glutenFree, (newValue){
            setState(() {
              _glutenFree=newValue;
            });
            },
            ),
            switchTileList('vegetarian', ' include vegetalian  meal only', _vegetarian, (newValue){
              setState(() {
                _vegetarian=newValue;
              });
            }),
            switchTileList('vegan', 'only include vagan meal only', _vegan, (newValue){
              setState(() {
                _vegan=newValue;
              });
            }),
            switchTileList('lactose-free', 'only include lactose meal only', _lactoseFree, (newValue){
              setState(() {
                _lactoseFree=newValue;
              });
            })
             
            // SwitchListTile(title:Text('gluten-free'),value:_glutenFree,subtitle: Text('only include gluten-free meals.'), onChanged:(newValue){
            //   setState(() {
            //     _glutenFree=newValue; 
            //   });
            // }
            // )
          ]
          ),
      
          )
      ,

       ] 
       ),
    
    
    );
  }
}