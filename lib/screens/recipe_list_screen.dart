import 'package:flutter/material.dart';
import '../Models/recipe_model.dart';
import '../services/recipe_service.dart';

class RecipeListScreen extends StatelessWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recipe List')),
      body: FutureBuilder<List<Recipe>>(
        future: RecipeService.getRecipeList(),
        builder: (_, collections) {
          final List<Recipe> recipes = collections.data!;
          if (collections.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          if (collections.hasError) {
            return Center(
              child: Text(
                collections.error.toString(),
                style: const TextStyle(color: Colors.red, fontSize: 20),
              ),
            );
          }

          if (!collections.hasData || collections.data!.isEmpty) {
            return const Center(
              child: Text(
                'No Data Found',
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
            );
          }
          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (_, index) {
              final recipe = recipes[index];
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 25,
                    child: Text(
                        '${index + 1}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    recipe.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),

                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: recipe.ingredients.map((ingredient){
                          return Chip(label: Text(
                              ingredient,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                            backgroundColor: Colors.teal.shade100,
                            padding: const EdgeInsets.all(2),
                          );

                        }).toList(),

                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
