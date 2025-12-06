import 'dart:convert';

import '../Models/recipe_model.dart';

class RecipeService{
  static String rowJsonData = '''
  {
    "recipes": [
        {
            "title": "Pasta Carbonara",
            "description": "Creamy pasta dish with bacon and cheese.",
            "ingredients": [
                "spaghetti",
                "bacon",
                "egg",
                "cheese"
            ]
        },
        {
            "title": "Caprese Salad",
            "description": "Simple and refreshing salad with tomatoes, mozzarella, and basil.",
            "ingredients": [
                "tomatoes",
                "mozzarella",
                "basil"
            ]
        },
        {
            "title": "Banana Smoothie",
            "description": "Healthy and creamy smoothie with bananas and milk.",
            "ingredients": [
                "bananas",
                "milk"
            ]
        },
        {
            "title": "Chicken Stir-Fry",
            "description": "Quick and flavorful stir-fried chicken with vegetables.",
            "ingredients": [
                "chicken breast",
                "broccoli",
                "carrot",
                "soy sauce"
            ]
        },
        {
            "title": "Grilled Salmon",
            "description": "Delicious grilled salmon with lemon and herbs.",
            "ingredients": [
                "salmon fillet",
                "lemon",
                "olive oil",
                "dill"
            ]
        },
        {
            "title": "Vegetable Curry",
            "description": "Spicy and aromatic vegetable curry.",
            "ingredients": [
                "mixed vegetables",
                "coconut milk",
                "curry powder"
            ]
        },
        {
            "title": "Berry Parfait",
            "description": "Layered dessert with fresh berries and yogurt.",
            "ingredients": [
                "berries",
                "yogurt",
                "granola"
            ]
        }
    ]
}
  
  ''';

  static Future<List<Recipe>> getRecipeList() async{
    final Map<String, dynamic>  decodedJson = jsonDecode(rowJsonData); //Decode JSON data to Map

    //Mao tO list of Recipe objects from the decoded JSON data(USING recipes KEY)
    final List<dynamic> recipeJsonList = decodedJson['recipes'];

    //Convert each JSON object in the list to a Recipe object using fromJson factory constructor
    return recipeJsonList.map((jsondata)=> Recipe.fromJson(jsondata)).toList();




  }


}