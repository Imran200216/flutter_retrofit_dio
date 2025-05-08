part of 'recipe_bloc.dart';

sealed class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class LoadRecipeEvent extends RecipeEvent {
  @override
  List<Object> get props => [];
}
