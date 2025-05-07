import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_retrofit_dio/features/home/domain/entities/Todo.dart';
import 'package:flutter_retrofit_dio/features/home/domain/usecases/fetch_todos.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final FetchTodos fetchTodos;

  TodoBloc(this.fetchTodos) : super(TodoInitial()) {
    // Todo Loading event
    on<LoadTodoEvent>((event, emit) async {
      emit(TodoLoading());

      try {
        final todos = await fetchTodos();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
  }
}
