import 'dart:convert';

class Task {
  String name;
  int isDone;
  String dateTime;
  Task({required this.name, this.isDone = 0, required this.dateTime
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
        isDone = jsonData['isDone'],
        dateTime = jsonData['dateTime'];

  static Map<String, dynamic> toMap(Task task) => {
        'name': task.name,
        'isDone': task.isDone,
        'dateTime': task.dateTime,
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
