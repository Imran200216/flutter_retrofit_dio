import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/repository/recipe_repository.dart';

class FetchRecipe {
  final RecipeRepository recipeRepository;

  FetchRecipe(this.recipeRepository);



  // Get Recipes
  Future<List<Recipe>> call() async {
    return await recipeRepository.getRecipes();
  }
}
