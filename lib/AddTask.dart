import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
        home: Scaffold(
            body: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: (0.05) * h),
        height: (0.05) * h,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
                margin: EdgeInsets.only(top: 10, left: (0.25) * w),
                height: (0.05) * h,
                child: Center(
                    child: Text(
                  "Add Task",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                )))
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: (0.2) * h),
        width: (0.8) * w,
        height: (0.3) * h,
        child: Card(
          elevation: 10,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 30, top: 20),
                  child: Text(
                    "Title",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 50, bottom: 30),
                child: Text(
                  "Description",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.watch_later,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print("pressed");
                      },
                    ),
                    Text(
                      "8:00 AM",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print("pressed");
                      },
                    ),
                    Text(
                      "Feb 20",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ])));
  }
}
