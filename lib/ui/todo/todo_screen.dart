import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practise/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_practise/bloc/todo/todo_event.dart';
import 'package:flutter_bloc_practise/bloc/todo/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Screen'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text('No todo Found'),
            );
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.todoList[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<TodoBloc>().add(
                            RemoveTodoEvent(remove: state.todoList[index]));
                      },
                    ),
                  );
                });
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context.read<TodoBloc>().add(AddTodoEvent(task: "this$i"));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
