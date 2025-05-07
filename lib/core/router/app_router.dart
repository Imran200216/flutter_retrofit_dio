import 'package:flutter_retrofit_dio/features/auth/presentation/screens/auth_forget_password_screen.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/screens/auth_login_screen.dart';
import 'package:flutter_retrofit_dio/features/auth/presentation/screens/auth_sign_up_screen.dart';
import 'package:flutter_retrofit_dio/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/authLogin",

  routes: [
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
  ],
);
