/*
Modify the Recipe class so its instances can be constants, and create a constant constructor that does the following:

* Has three parameters: ingredients, calories, and milligramsOfSodium (in that order).
* Uses this. syntax to automatically assign the parameter values to the object properties of the same name.
* Is constant, with the const keyword just before Recipe in the constructor declaration.

class Recipe {
  List<String> ingredients;
  int calories;
  double milligramsOfSodium;
}

*/
class Recipe {
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;
  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
}
