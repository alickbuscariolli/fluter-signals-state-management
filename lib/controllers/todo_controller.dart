import 'package:signal_demo/models/todo_model.dart';
import 'package:signals/signals.dart';

class TodoController {
  final todos = <TodoModel>[].toSignal();

  late final todosStatusString = computed(() {
    final notCompletedTodos = todos.where((todo) => !todo.completed);

    if (todos.isEmpty) {
      return "Você não possui nenhuma tarefa";
    } else if (notCompletedTodos.isEmpty) {
      return "Parabéns! Todas as tarefas estão completas!";
    }
    return "Você possui ${notCompletedTodos.length} tarefa${notCompletedTodos.length == 1 ? '' : 's'}";
  });

  void addTodo(TodoModel todo) {
    todos.add(todo);
  }

  void removeTodo(TodoModel todo) {
    todos.removeWhere((todoFromList) => todoFromList.id == todo.id);
  }

  void onChangeCompletedTodo(TodoModel todoToUpdate) {
    todos.value = todos.map((todo) {
      if (todoToUpdate.id == todo.id) {
        return todo.copyWith(completed: !todoToUpdate.completed);
      }
      return todo;
    }).toList();
  }
}
