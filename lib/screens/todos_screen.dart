import 'package:flutter/material.dart';
import 'package:signal_demo/controllers/todo_controller.dart';
import 'package:signal_demo/widgets/add_todo_form_widget.dart';
import 'package:signals/signals_flutter.dart';

final todoCtrl = TodoController();

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = todoCtrl.todos;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Todos com Signal',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => showModalBottomSheet(
                context: context, builder: (_) => const AddTodoFormWidget()),
            icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: Watch.builder(
        builder: (_) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  todoCtrl.todosStatusString.value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (_, int index) {
                  final todo = todos[index];

                  return ListTile(
                    leading: Checkbox(
                      value: todo.completed,
                      onChanged: (_) => todoCtrl.onChangeCompletedTodo(todo),
                    ),
                    title: Text(
                      todo.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      todo.description ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => todoCtrl.removeTodo(todo),
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
