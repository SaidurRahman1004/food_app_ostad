class Recipe {
  final String title;
  final String description;
  final List<String> ingredients;

  Recipe({
    required this.title,
    required this.description,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      ingredients: List<String>.from(json['ingredients'] ?? []),
    );
  }
}

class RecipeResponse {
  final List<Recipe> recipes;

  RecipeResponse({required this.recipes});

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
      recipes: (json['recipes'] as List)
          .map((recipeJson) => Recipe.fromJson(recipeJson))
          .toList(),
    );
  }
}
