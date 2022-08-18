import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/tasks_list.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.amber[900],
                  child: const Icon(
                    Icons.list,
                    color: Colors.black87,
                    size: 30.0,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  'ToDo',
                  style: TextStyle(
                      color: Colors.amber[900],
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.amber[900],
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: const TasksList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskScreen(),
              ),
            ),
          );
        },
        backgroundColor: Colors.black87,
        child: Icon(
          Icons.add,
          color: Colors.amber[900],
        ),
      ),
    );
  }
}

// setState(() {
//   tasks.add(Task(name: newTaskTitle));
// });

// addTaskCallBack: (newTaskTitle) {
//   Navigator.pop(context);
// }