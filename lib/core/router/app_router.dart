import 'package:flutter_retrofit_dio/features/auth/presentation/screens/auth_forget_password_screen.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/screens/auth_sign_up_screen.dart';
import 'package:flutter_retrofit_dio/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:flutter_retrofit_dio/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_retrofit_dio/features/recipe_description/presentation/screens/recipe_description_screen.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_retrofit_dio/features/recipes/presentation/screens/recipes_screen.dart';
import 'package:flutter_retrofit_dio/features/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/recipe",

  routes: [
    // Splash
    GoRoute(
      path: "/splash",
      name: "splash",
      builder: (context, state) => SplashScreen(),
    ),

    // Home
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) => HomeScreen(),
    ),

    // Auth Login Screen
    GoRoute(
      path: "/authLogin",
      name: "authLogin",
      builder: (context, state) => AuthLoginScreen(),
    ),

    // Auth Signup Screen
    GoRoute(
      path: "/authSignUp",
      name: "authSignUp",
      builder: (context, state) => AuthSignUpScreen(),
    ),

    // Auth Forget Password Screen
    GoRoute(
      path: "/authForgetPassword",
      name: "authForgetPassword",
      builder: (context, state) => AuthForgetPasswordScreen(),
    ),

    // Recipe Screen
    GoRoute(
      path: "/recipe",
      name: "recipe",
      builder: (context, state) {
        return RecipesScreen();
      },
    ),

    // Recipe Description Screen
    GoRoute(
      path: "/recipeDescripiton",
      name: "recipeDescription",
      builder: (context, state) {
        // extras
        final recipe = state.extra as Recipe;

        return RecipeDescriptionScreen(recipe: recipe);
      },
    ),

    // Favorite Screen
    GoRoute(
      path: "/favorite",
      name: "favorite",
      builder: (context, state) => FavoritesScreen(),
    ),
  ],
);
