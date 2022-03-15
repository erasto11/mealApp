import'package:flutter/material.dart';
import '/dummy_data.dart';
import 'package:second1/categories/widget/categories_iterm.dart';
class CategoriesScrean extends StatelessWidget{
  Widget build(BuildContext context){
    return GridView(
        padding: EdgeInsets.all(20),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
     maxCrossAxisExtent: 200,
     childAspectRatio: 3/2,
     crossAxisSpacing:20,
     mainAxisSpacing: 20,
    ),
    children: DUMMY_CATEGORIES.map((catData)=>CategoriesItem(catData.title,catData.color,catData.id)).toList(),
    );
      
  }
}