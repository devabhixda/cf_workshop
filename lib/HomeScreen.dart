import 'package:flutter/material.dart';
import 'package:todo/AddTask.dart';
import 'package:todo/Done.dart';
import 'package:todo/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/utils/database_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
                child: Container(
                    margin: EdgeInsets.only(top: 50),
                    height: (0.05) * h,
                    child: Center(
                        child: Text(
                      "Tasks",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    )))),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 40),
              child: Text(
                "Favourites",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                height: (0.20) * h,
                width: w,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: (0.5) * w,
                      child: Card(elevation: 2, color: Colors.black, child: Column(children: <Widget>[
                        Container(
                          height: (0.13) * h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: (0.3) * w),
                          child: IconButton(icon: Icon(Icons.done_outline, size: 20,color: Colors.white,), onPressed: null),
                        )
                      ],),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: (0.5) * w,
                      child: Card(elevation: 2, color: Colors.black),
                    )
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(top: 60, left: 40),
              child: Text(
                "Upcoming Tasks",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                height: (0.33) * h,
                width: w,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: (0.4) * w,
                      child: Card(elevation: 2, color: Colors.black, child: Column(children: <Widget>[
                        Container(
                          height: (0.26) * h,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.done_outline, color: Colors.white, size: 30,),
                              onPressed: (){
                                print("Pressed");
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_outline, color: Colors.white, size: 30,),
                              onPressed: (){
                                print("Pressed");
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.star_border, color: Colors.white, size: 30,),
                              onPressed: (){
                                print("Pressed");
                              },
                            )
                          ],
                        )
                        )
                      ],),),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: (0.4) * w,
                      child: Card(elevation: 2, color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: (0.4) * w,
                      child: Card(elevation: 2, color: Colors.black),
                    ),
                  ],
                )),
          ]),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTask(Note('', ''))));
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Card(
                      color: Colors.black,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Add task",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white))
                            ],
                          ))))),
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Done()));
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Card(
                      color: Colors.black,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.history,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Completed",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white))
                            ],
                          ))))),
        ],
      ),
    ));
  }
}
