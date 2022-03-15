import 'package:flutter/material.dart';
import 'package:second1/categories/screen/categorie_screan.dart';
import 'package:second1/categories/screen/filter_screen.dart';
import 'package:second1/categories/screen/mealdetailScreen.dart';
import 'package:second1/categories/screen/tapScreen.dart';
import 'package:second1/categories/widget/categories_iterm.dart';
import 'package:second1/categories/screen/iterm_meals_screan.dart';
import 'package:second1/dummy_data.dart';
import '../categories/model/meal.dart';

void  main() {
  runApp(MySecond());
}
class MySecond extends StatefulWidget{

  @override
  _MySecondState createState() => _MySecondState();
}

class _MySecondState extends State<MySecond> {
  Map<String,bool> newList={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegatalian':false,


  };
  List<Meals> _availableMeal =DUMMY_MEALS;
  List<Meals> _favourity = [];
  
  void setFilter(Map<String,bool>filterData){
setState(() {
  newList=filterData;
  _availableMeal=DUMMY_MEALS.where((meal){
    if(newList['gluten']! && !meal.isGlutenFree){
      return false;
    };
    if (newList['lactose']! && !meal.isLactoseFree){
      return false;
    }
    if (newList['vegan']!&& !meal.isVagan){
      return false;
    }
    if(newList['vegatalian']!&& !meal.isVegatarian){
      return false;
    }
     return true;
  }).toList();
});
  }
  void _toggleFavourity(String mealId){
   final exitingIndex= _favourity.indexWhere((meal)=>meal.id==mealId);
   if(exitingIndex>=0){
     setState(() {
       _favourity.removeAt(exitingIndex);
     });

   }
   else
   {
     setState(() {
       _favourity.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
     });
   }

    
  }
  bool measure(String id){
    return _favourity.any((meal)=>meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'viewing',
      theme: ThemeData(
      primarySwatch: Colors.pink,
      accentColor:Colors.amber,
      canvasColor: Color.fromRGBO(255, 254, 229,1),
      fontFamily: 'Raleway',
      textTheme: ThemeData.light().textTheme.copyWith(
        body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1),),
        body2: TextStyle(color:Color.fromRGBO(20, 51, 51, 1),),
        title: TextStyle(fontSize: 24 ,fontFamily:'RobotoCondensed')
      )
      ),
      //home:CategoriesScrean(),
      initialRoute: '/',

      routes: {
        '/':(ctx)=>Favaurity(_favourity),
        ItermMeals.routeName:(ctx) => ItermMeals(_availableMeal),
        MealDetails.routName:(ctx)=>MealDetails(measure, _toggleFavourity),
        Filter_Screen.routName:(ctx)=> Filter_Screen(newList,setFilter),
      },
      );
      
    
  }
}
