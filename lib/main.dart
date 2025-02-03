import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constans/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // sağ üst köşeden debug yazısı kaldırıldı
      home: SafeArea(
        // containerın cihazlardaki en üst panele gelmemesini sağlar
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Column(
            children: [
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
                          "02.02.2025",
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
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.notes_outlined, size: 40),
                            Text(
                              "English Lesson",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.notes_outlined, size: 40),
                            Text(
                              "English Lesson",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.notes_outlined, size: 40),
                            Text(
                              "English Lesson",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
