import 'task.dart';

class TodoList {
  String name;
  List<Task> tasks;

  TodoList({required this.name, this.tasks = const []});
}
