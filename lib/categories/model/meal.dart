enum Complexity{
simple,
challenging,
hard}
enum Affordability{
  affordable,
  pricely,
  luxury,
}
class Meals{
final String id;
final List<String> categoriesId;
final String title;
final String imageUrl;
final List<String> ingredients;
final List<String> steps;
final int dulation;
final Complexity complexity;
final Affordability afforda;
final bool isGlutenFree;
final bool isLactoseFree;
final bool isVagan;
final bool isVegatarian;
const Meals({required this.id,required this.categoriesId,required this.title,required this.afforda,required this.complexity,required this.imageUrl,required this.dulation,required this.ingredients,required this.steps,required this.isGlutenFree,required this.isVagan,required this.isVegatarian,required this.isLactoseFree,});
}
