import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:todo_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) async {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void upDateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
