import 'package:flutter_retrofit_dio/features/home/domain/entities/Todo.dart';
import 'package:flutter_retrofit_dio/features/home/domain/repository/todo_repository.dart';

class FetchTodos {
  final TodoRepository repository;

  FetchTodos(this.repository);

  Future<List<Todo>> call() async {
    return await repository.getTodos();
  }
}
