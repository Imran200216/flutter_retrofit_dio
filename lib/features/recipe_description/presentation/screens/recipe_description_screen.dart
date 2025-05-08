import 'package:flutter/material.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';
import 'package:go_router/go_router.dart';

class RecipeDescriptionScreen extends StatelessWidget {
  final Recipe recipe;
  const RecipeDescriptionScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading icon
        leading: IconButton(
          onPressed: () {
            // navigate to back screen
            GoRouter.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),

        // title
        title: Text(recipe.name),
        // title style
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),

        actions: [
          // Favorite
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite, color: Colors.black),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            spacing: 2,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipe id
              Text(recipe.id.toString()),

              // Recipe name
              Text(recipe.name),

              // Recipe ingredients
              Text(recipe.ingredients.join(', ')),

              // Recipe Instructins
              Text(recipe.instructions.join('\n')),
            ],
          ),
        ),
      ),
    );
  }
}
