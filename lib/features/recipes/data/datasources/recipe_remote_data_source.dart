import 'package:flutter_retrofit_dio/core/api/api_client.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';

abstract class RecipeRemoteDataSource {
  Future<List<Recipe>> fetchRecipes();
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final ApiClient apiClient;

  RecipeRemoteDataSourceImpl(this.apiClient);



  @override
  Future<List<Recipe>> fetchRecipes() async {
    final reponse = await apiClient.getRecipes();

    return reponse.recipes;
  }
}
