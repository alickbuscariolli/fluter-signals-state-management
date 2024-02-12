import 'package:flutter/material.dart';
import 'package:signal_demo/models/todo_model.dart';
import 'package:signal_demo/screens/todos_screen.dart';

class AddTodoFormWidget extends StatefulWidget {
  const AddTodoFormWidget({super.key});

  @override
  State<AddTodoFormWidget> createState() => _AddTodoFormWidgetState();
}

class _AddTodoFormWidgetState extends State<AddTodoFormWidget> {
  final titleTEC = TextEditingController();
  final descriptionTEC = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onAddTodo() {
    if (formKey.currentState!.validate()) {
      todoCtrl
          .addTodo(TodoModel(titleTEC.text, description: descriptionTEC.text));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleTEC,
              validator: (String? newTitle) {
                if (newTitle == null || newTitle.isEmpty) {
                  return 'Por favor insira um título';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Título',
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: descriptionTEC,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onAddTodo,
              child: const Text('Add todo'),
            )
          ],
        ),
      ),
    );
  }
}
