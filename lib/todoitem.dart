import 'package:flutter/material.dart';
import 'package:todo_app/constans/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task});
  final Task task;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ternary operation:    if(a==5) {burası çalışır} ----> a==5 ? Dogruysa burası : Yanlışsa burası çalışır
            widget.task.type == TaskType.note
                ? Image.asset("lib/assets/images/Category.png")
                : widget.task.type == TaskType.contest
                    ? Image.asset("lib/assets/images/Category 3.png")
                    : Image.asset("lib/assets/images/Category2.png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(widget.task.description),
                ],
              ),
            ),
            Checkbox(
                value: isChecked,
                onChanged: (val) => {
                      setState(
                        () {
                          isChecked = val!;
                        },
                      ),
                    }),
          ],
        ),
      ),
    );
  }
}
