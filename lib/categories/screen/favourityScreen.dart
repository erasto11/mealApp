import 'package:flutter/material.dart';
import '../widget/meal_iterms.dart';
//import 'package:second1/dummy_data.dart';
import '../model/meal.dart';

class FavourityItems extends StatelessWidget{
  final List<Meals> favourity;
  FavourityItems(this.favourity);
  Widget build (BuildContext context){
    if( favourity.isEmpty){
      return  Center(child: Text('the favourty is empty'),);
    }
    else{
    return ListView.builder(itemBuilder: (ctx, index){
  //return Text(categoriesMeal.elementAt(index).title);
  return MealIterms(id:favourity.elementAt(index).id,title:favourity.elementAt(index).title, url:favourity.elementAt(index).imageUrl, dulation:favourity.elementAt(index).dulation, complexity:favourity.elementAt(index).complexity, affordability:favourity.elementAt(index).afforda);
  },
  itemCount:favourity.length ,);
    
  }
  }
}