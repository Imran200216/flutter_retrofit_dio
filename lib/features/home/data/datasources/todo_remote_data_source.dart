import 'package:flutter_retrofit_dio/core/api/api_client.dart';
import 'package:flutter_retrofit_dio/features/home/data/models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> fetchTodos();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final ApiClient apiClient;

  TodoRemoteDataSourceImpl(this.apiClient);

  @override
  Future<List<TodoModel>> fetchTodos() async {
    final response = await apiClient.getTodos();

    return response.todos;
  }
}
