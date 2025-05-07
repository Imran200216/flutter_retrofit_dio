import 'package:flutter/material.dart';
import 'package:flutter_retrofit_dio/features/home/domain/entities/Todo.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(todo.todo),
        subtitle: Text(todo.completed ? "Completed" : "Incomplete"),
        trailing: Icon(
          todo.completed ? Icons.check_circle : Icons.circle,
          color: todo.completed ? Colors.green : Colors.grey,
        ),
      ),
    );
  }
}