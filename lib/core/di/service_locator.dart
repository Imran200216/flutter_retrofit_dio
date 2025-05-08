import 'package:flutter_retrofit_dio/core/api/api_client.dart';
import 'package:flutter_retrofit_dio/core/api/dio_client.dart';
import 'package:flutter_retrofit_dio/features/home/data/datasources/todo_remote_data_source.dart';
import 'package:flutter_retrofit_dio/features/home/data/repository/todo_repository_impl.dart';
import 'package:flutter_retrofit_dio/features/home/domain/repository/todo_repository.dart';
import 'package:flutter_retrofit_dio/features/home/domain/usecases/fetch_todos.dart';
import 'package:flutter_retrofit_dio/features/home/presentation/blocs/todo_bloc.dart';
import 'package:flutter_retrofit_dio/features/recipes/data/datasources/recipe_remote_data_source.dart';
import 'package:flutter_retrofit_dio/features/recipes/data/repository/recipe_repository_impl.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/repository/recipe_repository.dart';
import 'package:flutter_retrofit_dio/features/recipes/domain/usecases/fetch_recipe.dart';
import 'package:flutter_retrofit_dio/features/recipes/presentation/bloc/recipe_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Dio Client
  final dioClient = DioClient();
  sl.registerLazySingleton(() => dioClient.dio);

  // API Client
  sl.registerLazySingleton(() => ApiClient(sl()));

  // Todo Use Cases
  sl.registerLazySingleton(() => FetchTodos(sl()));

  // Todo Data Source
  sl.registerLazySingleton<TodoRemoteDataSource>(
    () => TodoRemoteDataSourceImpl(sl()),
  );

  // Todo Repository
  sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));

  // Todo Blocs
  sl.registerFactory(() => TodoBloc(sl()));

  sl.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<RecipeRepository>(() => RecipeRepositoryImpl(sl()));

  sl.registerLazySingleton(() => FetchRecipe(sl()));

  sl.registerFactory(() => RecipeBloc(sl()));
}
