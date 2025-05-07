import 'package:dio/dio.dart';
import 'package:flutter_retrofit_dio/features/home/data/models/todo_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  // Get Todos List
  @GET("/todos")
  Future<TodoListResponse> getTodos();
}
