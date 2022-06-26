import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/domain/todo/notifiers/todo_notifier.dart';

class TodoList extends ConsumerWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosNotifier = ref.watch(todosProvider.notifier);
    final todos = ref.watch(filteredTodosProvider);
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Dismissible(
          key: Key(todo.id),
          onDismissed: (_) => todosNotifier.deleteTodo(todo.id),
          child: ListTile(
            key: Key(todo.id),
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.completed,
              onChanged: (val) {
                val != null && val ? todosNotifier.completed(todo.id) : todosNotifier.completed(todo.id, status: false);
              },
            ),
          ),
        );
      },
    );
  }
}
