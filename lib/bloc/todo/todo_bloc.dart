import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/todo/todo_event.dart';
import 'package:flutter_bloc_practise/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todolist = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removetodo);
  }

  void _addTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    todolist.add(event.task);
    emit(state.copyWith(todoList: List.from(todolist)));
  }

  void _removetodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    todolist.remove(event.remove);
    emit(state.copyWith(todoList: List.from(todolist)));
  }
}
