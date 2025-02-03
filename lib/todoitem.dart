import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.title});
  final String title;

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
            Icon(Icons.notes_outlined, size: 40),
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
