import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constans/color.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/todoitem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  List<String> todo = ["Study English", "Walk", "Flutter"];
  List<String> completed = ["Take out trash", "Housework"];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: SafeArea(
        // containerın cihazlardaki en üst panele gelmemesini sağlar
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
              // header
              Container(
                width: deviceWidth, //responsive tasarım için kullanılıyor
                height: deviceHeight / 3,
                decoration: BoxDecoration(
                  color: Colors.purple[300],
                  image: DecorationImage(
                      image: AssetImage("lib/assets/images/Ellipse 2.png"),
                      fit: BoxFit
                          .cover), // imageın ekrana tam sığması için yapılıyor
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "April 18 2025",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "My To Do List",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              // top column
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                    //bu childın altına koyulan tek childda sonsuz scroll yapabilriz
                    child: ListView.builder(
                      primary: false,
                      shrinkWrap:
                          true, //ListView.builderın kendine ait alanla sınırlı kalmasını sağlıyor
                      itemCount: todo.length,
                      itemBuilder: (context, index) {
                        return TodoItem(title: todo[index]);
                      },
                    ),
                  ),
                ),
              ),
              // completed text
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Completed",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )),
              ),
              // bottom column
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: SingleChildScrollView(
                      //bu childın altına koyulan tek childda sonsuz scroll yapabilriz
                      child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: completed.length,
                    itemBuilder: (context, index) {
                      return TodoItem(title: completed[index]);
                    },
                  )),
                ),
              ),

              ElevatedButton(onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddNewTask(), )
                );
              }, child: Text("Add New Button"))
            ],
          ),
        ),
      ),
    );
  }
}
