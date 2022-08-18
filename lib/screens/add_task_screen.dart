import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:todo_flutter/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final textEditingController = TextEditingController();

  String? get _errorText {
    final text = textEditingController.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  String newTask = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 117, 117, 117),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber[900],
                  fontSize: 30.0,
                ),
              ),
              TextField(
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    newTask = value;
                  });
                },
                autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  errorText: _errorText,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(255, 111, 0, 1)),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              TextButton(
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTask);

                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber[900],
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// addTaskCallBack(newTask);

// SharedPreferences prefs = await SharedPreferences.getInstance();
// final data = Task(
//   name: newTask,
//   isDone: false,
// );
// String json = jsonEncode(data);
// // print('Generated Json : $json');
// prefs.setString('newTaskData', json);