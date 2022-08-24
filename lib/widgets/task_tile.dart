import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final int isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallBack;
  final Function() longPressCallBack;
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallBack,
    required this.longPressCallBack,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(
          color: Colors.black,
          decoration: isChecked == 1 ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.amber[900],
        value: isChecked == 0 ? false : true,
        // onChanged: toggleCheckBoxState,
        onChanged: checkboxCallBack,
      ),
    );
  }
}
