import 'package:flutter/material.dart';
import '../screen/filter_screen.dart';

class DrawerMain extends StatelessWidget{
  Widget buildList(String title, IconData icon, Function() clicdrawer){
    return ListTile(leading :Icon(icon, size:26 ), title:Text(title, style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            ),
            onTap:clicdrawer,
            );

  }
  Widget build(BuildContext context){
    return Drawer(
      child: Column(children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
             alignment: Alignment.centerLeft,
             color: Theme.of(context).accentColor,
             child: Text('cooking up!', style: TextStyle(
             fontWeight: FontWeight.w900,
             fontSize: 30,
             color: Theme.of(context).primaryColor,

             ),
             
             ),

            ),
            // SizedBox(height: 20,),
            // ListTile(leading :Icon(Icons.restaurant, size:26 ), title:Text('meals', style: TextStyle(
            //   fontFamily: 'RobotoCondensed',
            //   fontSize: 24,
            //   fontWeight: FontWeight.bold,
            // ),),)
          buildList('meal',Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }

          ),
          buildList('filter',Icons.settings,(){
            Navigator.of(context).pushNamed(Filter_Screen.routName);
          }),
      ],),
    );
  }
}