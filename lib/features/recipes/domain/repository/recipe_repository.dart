import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';

abstract class RecipeRepository {
  // Get Recipes
  Future<List<Recipe>> getRecipes();
}
