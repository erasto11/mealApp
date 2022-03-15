import 'package:flutter/material.dart';
import 'package:second1/categories/model/meal.dart';
import 'package:second1/categories/widget/meal_iterms.dart';
import '/dummy_data.dart';
class ItermMeals extends StatelessWidget{
  static const routeName = '/categories-meal';
  final List<Meals>  nwMeal;
  ItermMeals(this.nwMeal);

  // final String title;
  // final String id;
  // ItermMeals(this.id,this.title);

Widget build(BuildContext context){
 // RouteSettings settings;
  final routeArgs =
      ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
  final nameTitle=routeArgs['title'];
  final id = routeArgs['id'];
  final categoriesMeal = nwMeal.where((meals) {
    return meals.categoriesId.contains(id);
  });
  return Scaffold(appBar: AppBar(title:Text(nameTitle)),
  body: ListView.builder(itemBuilder: (ctx, index){
  //return Text(categoriesMeal.elementAt(index).title);
  return MealIterms(id:categoriesMeal.elementAt(index).id,title:categoriesMeal.elementAt(index).title, url:categoriesMeal.elementAt(index).imageUrl, dulation:categoriesMeal.elementAt(index).dulation, complexity:categoriesMeal.elementAt(index).complexity, affordability:categoriesMeal.elementAt(index).afforda);
  },
  itemCount:categoriesMeal.length ,)

  );
}

}