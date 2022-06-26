import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/domain/home/widgets/add_todo_form.dart';
import 'package:{{name}}/domain/home/widgets/todo_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Demo'),
      ),
      body: const TodoList(),
      floatingActionButton: const AddTodoForm(),
    );
  }
}
