import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constans/TaskList.dart';
import 'package:todo_app/constans/color.dart';
import 'package:todo_app/constans/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/service/todo_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> todo = [
    Task(
      type: TaskType.note,
      title: "Study English",
      description: "Study English",
      isCompleted: false,
    ),
    Task(
      type: TaskType.calendar,
      title: "Walk",
      description: " Walk 5 KM",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Flutter",
      description: "Flutter",
      isCompleted: false,
    ),
  ];

  List<Task> completed = [
    Task(
      type: TaskType.calendar,
      title: "Walk",
      description: " Walk 5 KM",
      isCompleted: false,
    ),
    Task(
      type: TaskType.contest,
      title: "Flutter",
      description: "Flutter",
      isCompleted: false,
    ),
  ];

  void addNewTask(Task newTask){
    setState(() {
      todo.add(newTask);
    });
  }


  @override
  Widget build(BuildContext context) {
    TodoService todoService = TodoService();
    todoService.getTodos();
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              // Header
              Container(
                width: deviceWidth,
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                  color: Colors.purple[300],
                  image: const DecorationImage(
                    image: AssetImage("lib/assets/images/Ellipse 2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "April 18 2025",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My To Do List",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // To-Do List
              Expanded(child: TaskList(tasks: todo, title: "To-Do List")),
              // Completed List
              Expanded(child: TaskList(tasks: completed, title: "Completed")),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNewTask(
                        addNewTask: (newTask) => addNewTask((newTask)),
                      ),
                    ),
                  );
                },
                child: const Text("Add New Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
