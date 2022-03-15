import'package:flutter/material.dart';
import 'package:second1/categories/model/meal.dart';
import '../screen/mealdetailScreen.dart';
//import '../screen/mealdetailScreen.dart';
class MealIterms extends StatelessWidget{
  final String id;
  final String title;
  final String url;
  final int dulation;
  final Complexity complexity;
  final Affordability affordability;
   MealIterms({required this.id,required this.title,required this.url,required this.dulation, required this.complexity, required this.affordability});
   String get complexityTest{
     switch(complexity){
       case Complexity.simple:
       return 'simple';
       break;
       case Complexity.challenging:
       return 'challenging';
       break;
       case Complexity.hard:
       return 'hard';
       default:
       return 'unkwon';
     }
   }
   String get affordabilityTx{
     switch(affordability){
       case Affordability.affordable:
       return 'affordable';
       break;
       case Affordability.luxury:
       return 'luxuly';
       break;
       case Affordability.pricely:
       return 'pricely';
       break;
       default:
       return 'unkwon';
     }
   }
   void meal(BuildContext context){
     Navigator.of(context).pushNamed(MealDetails.routName, arguments: id);
   }
  Widget build(BuildContext context){
   
    return InkWell(
     
     onTap:()=>meal(context),
     child: Card(shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(15) 
         ),
         elevation: 4,
         margin: EdgeInsets.all(10),
         child: Column(children: [
           Stack(children: [
             ClipRRect(borderRadius: BorderRadius.only(
               topLeft:Radius.circular(15),topRight:Radius.circular(15)

             ),
             child: Image.network(url,
             height: 255,
             width: double.infinity,
             fit: BoxFit.cover,
             ),
             ),
             Positioned(
              bottom:20,
              right:10,
              child:
             
             Container(
               width: 220,
               color: Colors.black54,
               padding:EdgeInsets.symmetric( vertical:5 ,horizontal: 20),
               child: Text(title, style: TextStyle(fontSize: 20,color: Colors.white),
               softWrap: true,
               overflow: TextOverflow.fade,

               )))
               
           ],),
            Padding(padding:EdgeInsets.all(20),
            child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround ,
                children: [
                  Row(
                    
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6,),
                      Text('$dulation min')

                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6,),
                      Text(complexityTest)
                    ],
                    
                  ),
                  Row(
                    children: [
                     Icon(Icons.accessibility),
                     SizedBox(width: 6,),
                     Text(affordabilityTx) 
                    ],
                  )

                ],

            ),
            )
         
         ],),
         )
     );

    
  }
}
