import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit_dio/common/widgets/app_spacer.dart';
import 'package:flutter_retrofit_dio/config/route_constants.dart';
import 'package:flutter_retrofit_dio/core/constants/app_constants.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_retrofit_dio/features/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:flutter_retrofit_dio/features/recipes/presentation/widgets/custom_recipe_card.dart';
import 'package:go_router/go_router.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  // Controller
  final TextEditingController recipeSearchController = TextEditingController();

  @override
  void initState() {
    // Load Recipe event
    context.read<RecipeBloc>().add(LoadRecipeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // recipe title
                Text(
                  AppConstants.recipeTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                AppVerticalSpacer(20),

                // Search Text field
                CustomInputField(
                  hintText: AppConstants.searchRecipeHintText,
                  controller: recipeSearchController,
                ),

                AppVerticalSpacer(20),

                // List of recipes
                BlocBuilder<RecipeBloc, RecipeState>(
                  builder: (context, state) {
                    // Loading state
                    if (state is RecipeLoading) {
                      return Text("Loading recipes...");
                    } else if (state is RecipeLoaded) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = state.recipes[index];

                          return CustomRecipeCard(
                            onTap: () {
                              // Retro Description screen
                              GoRouter.of(context).pushNamed(
                                RouteConstants.recipeDescription,

                                // Passing values to Recipe Description Screen
                                extra: Recipe(
                                  id: recipe.id,
                                  name: recipe.name,
                                  ingredients: recipe.ingredients,
                                  instructions: recipe.instructions,
                                  prepTimeMinutes: recipe.prepTimeMinutes,
                                  cookTimeMinutes: recipe.cookTimeMinutes,
                                  servings: recipe.servings,
                                  difficulty: recipe.difficulty,
                                  cuisine: recipe.cuisine,
                                  caloriesPerServing: recipe.caloriesPerServing,
                                  tags: recipe.tags,
                                  userId: recipe.userId,
                                  image: recipe.image,
                                  rating: recipe.rating,
                                  reviewCount: recipe.reviewCount,
                                  mealType: recipe.mealType,
                                ),
                              );
                            },
                            imageUrl: recipe.image,
                            title: recipe.name,
                            description: recipe.name,
                          );
                        },
                      );
                    } else if (state is RecipeError) {
                      return Center(child: Text("Error: ${state.message}"));
                    } else {
                      return const Center(child: Text("No Tods available"));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
