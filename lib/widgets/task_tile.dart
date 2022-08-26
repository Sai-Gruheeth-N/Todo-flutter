import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/update_task_screen.dart';

class TaskTile extends StatelessWidget {
  final int isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallBack;
  final Function() longPressCallBack;
  final String dateTime;
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallBack,
    required this.longPressCallBack,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      onLongPress: longPressCallBack,
      title: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskTitle,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                decoration: isChecked == 1 ? TextDecoration.lineThrough : null,
              ),
            ),
            Text(
              dateTime,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[500],
                decoration: isChecked == 1 ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: UpdateTaskScreen(
                      prevTitle: taskTitle,
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          Checkbox(
            activeColor: Colors.amber[900],
            value: isChecked == 0 ? false : true,
            // onChanged: toggleCheckBoxState,
            onChanged: checkboxCallBack,
          ),
        ],
      ),
    );
  }
}
