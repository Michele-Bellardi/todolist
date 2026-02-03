import 'package:flutter/material.dart';
import '../models/todo_list.dart';
import '../models/task.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoList> lists = [
    TodoList(name: "Lista principale", tasks: [])
  ];

  int selectedList = 0;

  TodoList get currentList => lists[selectedList];

  void addTask(String title) {
    currentList.tasks.add(Task(title: title));
    notifyListeners();
  }

  void toggleTask(int index) {
    currentList.tasks[index].done = !currentList.tasks[index].done;
    notifyListeners();
  }

  void addList(String name) {
    lists.add(TodoList(name: name, tasks: []));
    notifyListeners();
  }

  void changeList(int index) {
    selectedList = index;
    notifyListeners();
  }

  // Stats
  int get totalTasks => currentList.tasks.length;
  int get doneTasks => currentList.tasks.where((t) => t.done).length;
  int get todoTasks => totalTasks - doneTasks;

  double get efficiency =>
      totalTasks == 0 ? 0 : (doneTasks / totalTasks) * 100;
}
