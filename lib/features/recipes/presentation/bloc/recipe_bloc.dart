import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/usecases/fetch_recipe.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final FetchRecipe fetchRecipe;
  RecipeBloc(this.fetchRecipe) : super(RecipeInitial()) {
    on<RecipeEvent>((event, emit) {});

    on<LoadRecipeEvent>((event, emit) async {
      emit(RecipeLoading());

      try {
        final recipes = await fetchRecipe();
        emit(RecipeLoaded(recipes));
      } catch (e) {
        emit(RecipeError(e.toString()));
      }
    });
  }
}
