class Task {
  final String name;
  bool isDone;
  Task({
    required this.name,
    this.isDone = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isDone': isDone,
    };
  }

  void toggleDone() {
    isDone = !isDone;
  }

  Task.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        isDone = json['isDone'];
}
