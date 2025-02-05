import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/todoitem.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final String title;

  const TaskList({super.key, required this.tasks, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TodoItem(task: tasks[index]
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
