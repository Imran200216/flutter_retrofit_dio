import 'package:flutter_retrofit_dio/features/home/data/datasources/todo_remote_data_source.dart';
import 'package:flutter_retrofit_dio/features/home/domain/entities/Todo.dart';
import 'package:flutter_retrofit_dio/features/home/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDataSource remoteDataSource;

  TodoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    return await remoteDataSource.fetchTodos();
  }
}
