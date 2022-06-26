import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/domain/todo/states/todo.dart';
import 'package:uuid/uuid.dart';

final todosProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) => TodoNotifier());
final filteredTodosProvider = Provider((ref) {
  final todos = ref.watch(todosProvider);
  return todos;
});

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String title) {
    if (title != '') {
      const uuid = Uuid();
      state = [
        ...state,
        Todo(
          id: uuid.v4(),
          title: title,
          completed: false,
        )
      ];
    }
  }

  void completed(String id, {bool status = true}) {
    state = state
        .map(
          (todo) => todo.id == id ? todo.copyWith(completed: status) : todo,
        )
        .toList();
  }

  void deleteTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}
