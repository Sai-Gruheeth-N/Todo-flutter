import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: const MaterialApp(
        restorationScopeId: "root",
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
