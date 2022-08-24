import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<TaskData>(context, listen: false).getData();
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            taskData.sortTaskList();
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallBack: (checkBoxState) async {
                taskData.upDateTask(task);
                Provider.of<TaskData>(context, listen: false).saveData();
              },
              longPressCallBack: () async {
                taskData.removeTask(task);
                Provider.of<TaskData>(context, listen: false).saveData();
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


  // loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   String json = prefs.getString('newTaskData').toString();
  //   print('Loaded json : $json');

  //   if (json == null) {
  //     print('No data in SharedPreferences');
  //   } else {
  //     Map<String, dynamic> map = jsonDecode(json);
  //   }
  // }

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

// SharedPreferences prefs = await SharedPreferences.getInstance();
// final data = Task(
//   name: task.name,
//   isDone: task.isDone,
// );
// String json = jsonEncode(data);
// // print('Generated Json : $json');
// prefs.setString('newTaskData', json);


// SharedPreferences prefs = await SharedPreferences.getInstance();
// final data = Task(
//   name: task.name,
//   isDone: task.isDone,
// );
// String json = jsonEncode(data);
// // print('Generated Json : $json
// prefs.setString('newTaskData', json);