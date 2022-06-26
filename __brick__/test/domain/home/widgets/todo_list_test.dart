import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{name}}/domain/home/widgets/todo_list.dart';
import 'package:{{name}}/domain/todo/notifiers/todo_notifier.dart';
import 'package:{{name}}/domain/todo/states/todo.dart';

void main() {
  testWidgets('todo_list all displayed', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          filteredTodosProvider.overrideWithValue(
            [
              const Todo(
                id: '1',
                title: 'test',
                completed: false,
              ),
            ],
          ),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: TodoList(),
          ),
        ),
      ),
    );

    expect(find.byType(Dismissible), findsOneWidget);
  });
}
