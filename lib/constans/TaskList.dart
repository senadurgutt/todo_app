/* import 'package:flutter/material.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/todoitem.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final String title;

  const TaskList({super.key, required this.tasks, required this.title});

  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
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
              child: FutureBuilder(
                future: todoService.getUncompleted(),
                builder: (context, snapshot) {
                  print(snapshot.data);
                  //snapshot veriyi çektiğimiz zmanki görüntüsü demek, veride sonradan değişiklik olduğunda onu almıyor
                  if(snapshot.data == Null) {
                    return CircularProgressIndicator();

                  }else {
                    return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return TodoItem(task: snapshot.data![index]);
                    },
                  );

                  }
                 
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
*/ 