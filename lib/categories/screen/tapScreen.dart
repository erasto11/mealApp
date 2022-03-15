import 'package:flutter/material.dart';
import 'package:second1/categories/screen/categorie_screan.dart';
import 'package:second1/categories/screen/favourityScreen.dart';
import 'package:second1/categories/widget/main_drawer.dart';
import '../model/meal.dart';
class Favaurity extends StatefulWidget {
  final List<Meals> favouritydata;
  Favaurity(this.favouritydata);
  

  @override
  _FavaurityState createState() => _FavaurityState();
}

class _FavaurityState extends State<Favaurity> {
  late List<Map<String,dynamic>>_page;
  int selectedPageIndex = 0;
  @override
  void initState() {
    _page =[
    {'page':CategoriesScrean(),'title':'category'},
    {'page':FavourityItems(widget.favouritydata),'title':'your favority'},
  ];       
    super.initState();
  }
  void selectedItem(int index){
  setState(() {
    selectedPageIndex=index;
  });

  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(_page[selectedPageIndex]['title']), ),
      drawer: DrawerMain(),
      body: _page[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedItem,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        items: [
      BottomNavigationBarItem(icon:Icon(Icons.category),title: Text('category') ),
      BottomNavigationBarItem(icon:Icon(Icons.star),title:Text('favourity')),
      

      ],
      
      ),
      );
    
  }
}