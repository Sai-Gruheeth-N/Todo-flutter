import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String json = prefs.getString('newTaskData').toString();
    print('Loaded json : $json');

    if (json == null) {
      print('No data in SharedPreferences');
    } else {
      Map<String, dynamic> map = jsonDecode(json);
    }
  }

  // saveData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   final data = Task(
  //     name: task.name,
  //     isDone: task.isDone,
  //   );

  //   String json = jsonEncode(data);
  //   print('Generated Json : $json');
  //   prefs.setString('newTaskData', json);
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallBack: (checkBoxState) async {
                taskData.upDateTask(task);

                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // final data = Task(
                //   name: task.name,
                //   isDone: task.isDone,
                // );
                // String json = jsonEncode(data);
                // // print('Generated Json : $json');
                // prefs.setString('newTaskData', json);
              },
              longPressCallBack: () async {
                taskData.removeTask(task);

                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // final data = Task(
                //   name: task.name,
                //   isDone: task.isDone,
                // );
                // String json = jsonEncode(data);
                // // print('Generated Json : $json');

                // prefs.setString('newTaskData', json);
              },
            );
          },
        );
      },
    );
  }
}

// setState(() {
//   widget.task[index].toggleDone();
// });


// children: [
//   TaskTile(
//     taskTitle: tasks[0].name,
//     isChecked: tasks[0].isDone,
//   ),
//   TaskTile(
//     taskTitle: tasks[1].name,
//     isChecked: tasks[1].isDone, 
//   ),
//   TaskTile(
//     taskTitle: tasks[2].name,
//     isChecked: tasks[2].isDone,
//   ),
// ],