import 'package:flutter_retrofit_dio/features/home/domain/entities/Todo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo_model.g.dart';

@JsonSerializable()
class TodoModel extends Todo {
  TodoModel({
    required super.id,
    required super.todo,
    required super.completed,
    required super.userId,
  });

  //  From Json
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$TodoModelToJson(this);
}

// For List Response
@JsonSerializable()
class TodoListResponse {
  final List<TodoModel> todos;

  TodoListResponse({required this.todos});

  //  From Json
  factory TodoListResponse.fromJson(Map<String, dynamic> json) =>
      _$TodoListResponseFromJson(json);

  // To Json
  Map<String, dynamic> toJson() => _$TodoListResponseToJson(this);
}
