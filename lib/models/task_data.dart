import 'package:flutter/foundation.dart';
import 'dart:collection';
import 'package:todo_flutter/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

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

  void upDateTaskName(String prevTaskTitle, String updateTaskTitle) async {
    var task = _tasks.firstWhere((item) => item.name == prevTaskTitle);
    task.name = updateTaskTitle;
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

  void sortTaskList() {
    _tasks.sort((a, b) => a.isDone.compareTo(b.isDone));
    // notifyListeners();
  }

  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = Task.encode(tasks);
    await prefs.setString('task_data', encodedData);
    notifyListeners();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    final String taskString = prefs.getString('task_data').toString();
    List<Task> tasksData = Task.decode(taskString);
    _tasks = tasksData;
    notifyListeners();
  }
}
