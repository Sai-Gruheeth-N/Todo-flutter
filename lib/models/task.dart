import 'dart:convert';

class Task {
  final String name;
  int isDone;
  Task({
    required this.name,
    this.isDone = 0,
    // 0 = false and 1 = true
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  void toggleDone() {
    isDone = (isDone == 0) ? 1 : 0;
  }

  Task.fromJson(Map<String, dynamic> jsonData)
      : name = jsonData['name'],
        isDone = jsonData['isDone'];

  static Map<String, dynamic> toMap(Task task) => {
        'name': task.name,
        'isDone': task.isDone,
      };

  static String encode(List<Task> tasks) {
    return jsonEncode(
      tasks.map<Map<String, dynamic>>((task) => Task.toMap(task)).toList(),
    );
  }

  static List<Task> decode(String tasks) {
    var data = (jsonDecode(tasks) as List<dynamic>?);
    if (data != null) {
      return (jsonDecode(tasks) as List<dynamic>?)!.map<Task>((task) {
        return Task.fromJson(task);
      }).toList();
    } else {
      return <Task>[];
    }
  }
}
