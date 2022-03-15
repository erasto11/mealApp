import 'package:flutter/material.dart';
import '/dummy_data.dart';
class MealDetails extends StatelessWidget{
  static const routName = '/meal_details';
   final Function pressedNw;
   final Function measure;
  MealDetails(this.measure,this.pressedNw);
  
Widget buildSection(BuildContext context,String text){
return Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        child: Text(text,style:Theme.of(context).textTheme.title),
      );
}
Widget containerDecoloation( Widget child){
  return Container(
        decoration: (BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
  
        )
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child,
        );
}
Widget build (BuildContext context){
  final mealId = ModalRoute.of(context)!.settings.arguments as String;
  final mealInf = DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
  return Scaffold(
    appBar:AppBar(title: Text('${mealInf.title}'),),
    body: SingleChildScrollView(
      child: Column(children: [
        Container(
          child: Image.network(mealInf.imageUrl,
          fit: BoxFit.cover,
    
          ),
        ),
        buildSection(context, 'ingridients'),
        // Container(
        //   margin: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
        //   child: Text('ingredients',style:Theme.of(context).textTheme.title),
        // ),
        // Container(
        //   decoration: (BoxDecoration(
        //     color: Colors.white,
        //     border: Border.all(color: Colors.grey),
        //     borderRadius: BorderRadius.circular(10),
      
        //   )
        //   ),
        //   margin: EdgeInsets.all(10),
        //   padding: EdgeInsets.all(10),
        //   height: 150,
        //   width: 300,
        containerDecoloation(
          ListView.builder(
            itemBuilder: (context, index) => Card(
                
              color: Theme.of(context).accentColor,
              child:Padding(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
              child: Text(mealInf.ingredients[index]),)
            ),
            itemCount: mealInf.ingredients.length,)
          ),
      
          buildSection(context, 'steps'),
          containerDecoloation(
            ListView.builder(itemBuilder: (context,index)=>ListTile(
            leading: CircleAvatar(
            child: Text('#${index+1}') ,),
            title: Text(mealInf.steps[index]),
            ),
            itemCount: mealInf.steps.length,
            )
          )
    
      ],),
    
     ),
     floatingActionButton: FloatingActionButton(onPressed:()=>pressedNw(mealId),child:Icon(measure(mealId)? Icons.star: Icons.star_border,),
  ));
}

}