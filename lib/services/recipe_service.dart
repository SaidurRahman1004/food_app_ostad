import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/recipe_model.dart';

class RecipeService {
  static Future<List<Recipe>> loadRecipes() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/recipes.json',
      );

      final Map<String, dynamic> jsonData = jsonDecode(jsonString);
      final RecipeResponse response = RecipeResponse.fromJson(jsonData);

      return response.recipes;
    } catch (e) {
      print('Error loading recipes: $e');
      return [];
    }
  }
}
