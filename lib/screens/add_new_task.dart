import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constans/color.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView( // notes yazarken overflow hatasını kaldırdı
          child: Column(
            children: [
              Container(
                width: deviceWidth, //responsive tasarım için kullanılıyor
                height: deviceHeight / 10,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/Ellipse 1.png"),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "New Tasks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:10),
                child: Text("Task title")),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration:
                      InputDecoration(filled: true, fillColor: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Categories"),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(
                                milliseconds:
                                    500), //açılan content için süre koyuyor
                            content: Text("Category Selected"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/Category.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(
                                milliseconds:
                                    500), //açılan content için süre koyuyor
                            content: Text("Category Selected"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/Category2.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(
                                milliseconds:
                                    500), //açılan content için süre koyuyor
                            content: Text("Category Selected"),
                          ),
                        );
                      },
                      child: Image.asset("lib/assets/images/Category 3.png"),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("Date"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("Time"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:20),
                child: Text("Notes")),
              SizedBox(
                height: 300,
                child: TextField(
                  expands: true, //yazdıkça genişlesin
                  maxLines: null, // istediği kadar satır ekleyebilsin
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                  ),
                ),
              ),
ElevatedButton(onPressed: () {}, child: Text("Save"))

            ],
          ),
        ),
      ),
    );
  }
}
