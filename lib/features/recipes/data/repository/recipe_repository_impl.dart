import 'package:flutter_retrofit_dio/features/recipes/data/datasources/recipe_remote_data_source.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeRemoteDataSource recipeRemoteDataSource;

  RecipeRepositoryImpl(this.recipeRemoteDataSource);

  @override
  Future<List<Recipe>> getRecipes() async {
    return await recipeRemoteDataSource.fetchRecipes();
  }
}
