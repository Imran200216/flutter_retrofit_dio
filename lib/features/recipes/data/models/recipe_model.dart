import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class RecipeModel extends Recipe {
  RecipeModel({
    required super.id,
    required super.name,
    required super.ingredients,
    required super.instructions,
    required super.prepTimeMinutes,
    required super.cookTimeMinutes,
    required super.servings,
    required super.difficulty,
    required super.cuisine,
    required super.caloriesPerServing,
    required super.tags,
    required super.userId,
    required super.image,
    required super.rating,
    required super.reviewCount,
    required super.mealType,
  });

  // From Json
  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}

// For List Response
@JsonSerializable()
class RecipeListResponse {
  final List<RecipeModel> recipes;

  RecipeListResponse({required this.recipes});

  // From Json
  factory RecipeListResponse.fromJson(Map<String, dynamic> json) =>
      _$RecipeListResponseFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$RecipeListResponseToJson(this);
}
