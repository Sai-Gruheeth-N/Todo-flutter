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





// import 'package:flutter/material.dart';

// class TaskTile extends StatefulWidget {
//   @override
//   State<TaskTile> createState() => _TaskTileState();
// }

// class _TaskTileState extends State<TaskTile> {
//   bool isChecked = false;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(
//         'This is a task.',
//         style: TextStyle(
//           decoration: isChecked ? TextDecoration.lineThrough : null,
//         ),
//       ),
//       trailing: TaskCheckBox(
//         checkboxState: isChecked,
//         toggleCheckBoxState: (bool? checkBoxState) {
//           setState(() {
//             isChecked = checkBoxState ?? true;
//           });
//         },
//       ),
//     );
//   }
// }

// class TaskCheckBox extends StatelessWidget {
//   final bool checkboxState;
//   final Function(bool?) toggleCheckBoxState;
//   TaskCheckBox(
//       {required this.checkboxState, required this.toggleCheckBoxState});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.amber[900],
//       value: checkboxState,
//       onChanged: toggleCheckBoxState,
//     );
//   }
// }
