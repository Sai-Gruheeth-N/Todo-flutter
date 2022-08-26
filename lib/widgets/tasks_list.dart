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
              dateTime: task.dateTime,
            );
          },
        );
      },
    );
  }
}
