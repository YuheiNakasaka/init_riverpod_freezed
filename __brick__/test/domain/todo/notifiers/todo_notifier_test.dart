import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{name}}/domain/todo/notifiers/todo_notifier.dart';

void main() {
  late TodoNotifier notifier;

  group('TodoNotifier Test:', () {
    setUp(() {
      final container = ProviderContainer();
      notifier = container.read(todosProvider.notifier);
    });

    test('addTodo', () {
      expect(notifier.debugState.isEmpty, true);
      notifier.addTodo('test');
      expect(notifier.debugState.isEmpty, false);
      expect(notifier.debugState[0].title, 'test');
    });

    test('deleteTodo', () {
      expect(notifier.debugState.isEmpty, true);
      notifier.addTodo('test');
      final todos = notifier.debugState;
      expect(todos.isEmpty, false);
      notifier.deleteTodo(todos[0].id);
      expect(notifier.debugState.isEmpty, true);
    });

    test('completed', () {
      expect(notifier.debugState.isEmpty, true);
      notifier.addTodo('test');
      expect(notifier.debugState.isEmpty, false);
      expect(notifier.debugState[0].completed, false);
      notifier.completed(notifier.debugState[0].id);
      expect(notifier.debugState[0].completed, true);
    });
  });
}
