import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/domain/todo/notifiers/todo_notifier.dart';

class AddTodoForm extends ConsumerStatefulWidget {
  const AddTodoForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends ConsumerState<AddTodoForm> {
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    final todosNotifier = ref.watch(todosProvider.notifier);
    return FloatingActionButton(
      onPressed: () {
        showFormDialog(
          context,
          addCallback: todosNotifier.addTodo,
        );
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  void showFormDialog(
    BuildContext context, {
    void Function(String)? addCallback,
  }) {
    showDialog<void>(
      context: context,
      barrierColor: Colors.black54,
      builder: (context) {
        return Stack(
          children: [
            Align(
              child: SimpleDialog(
                title: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'New Task',
                        style: TextStyle(
                          color: Color(0xff1488C1),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextField(
                        autofocus: true,
                        onChanged: (value) {
                          setState(() => inputText = value);
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: 'Enter a task',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: ElevatedButton(
                        onPressed: () {
                          if (addCallback != null) {
                            addCallback(inputText);
                          }
                          Navigator.pop(context);
                        },
                        child: const Text('Add'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
