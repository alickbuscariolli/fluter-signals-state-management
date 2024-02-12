import 'package:uuid/uuid.dart';

class TodoModel {
  final String id;
  final String title;
  final String description;
  final bool completed;

  TodoModel(this.title, this.description, {String? idC, bool? completedC})
      : id = idC ?? const Uuid().v4(),
        completed = completedC ?? false;

  TodoModel copyWith({
    String? id,
    String? title,
    String? description,
    bool? completed,
  }) {
    return TodoModel(
      idC: id ?? this.id,
      title ?? this.title,
      description ?? this.description,
      completedC: completed ?? this.completed,
    );
  }
}
