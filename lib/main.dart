import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_retrofit_dio/core/di/service_locator.dart';
import 'package:flutter_retrofit_dio/core/router/app_router.dart';
import 'package:flutter_retrofit_dio/features/home/presentation/blocs/todo_bloc.dart';

void main() async {
  // dependency injection
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Todo Bloc
        BlocProvider(create: (context) => sl<TodoBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Retrofit and dio with clean architecture',
        // Go Router
        routerConfig: router,
      ),
    );
  }
}
