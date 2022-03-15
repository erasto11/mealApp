import'package:flutter/material.dart';
import 'package:second1/categories/screen/iterm_meals_screan.dart';
class CategoriesItem extends StatelessWidget{
  final String title;
  final Color color;
  final String id;
  
  void selection(BuildContext ctx){
    Navigator.of(ctx).pushNamed(ItermMeals.routeName,arguments: {
      'id':id,'title':title,
    });
  }
 
  CategoriesItem(this.title,this.color,this.id);

  Widget build(BuildContext context){
    return InkWell(
      onTap: ()=>selection(context),
      splashColor:Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child:Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: 
      [color.withOpacity(0.7),color],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      ),
       borderRadius: BorderRadius.circular(15),
      ),
      child: Text(title,style:Theme.of(context).textTheme.title, ),

    ));
  }
}