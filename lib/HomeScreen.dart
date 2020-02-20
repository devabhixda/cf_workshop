import 'package:flutter/material.dart';
import 'package:todo/AddTask.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            padding: EdgeInsets.all(40),
            child: Text(
              "Favourites",
              style: TextStyle(fontSize: 25),
            ),
          ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: (0.12) * h,
                width: w,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: (0.06) * h,
                      width: (0.7) * w,
                      child: Card(
                        color: Color(0xFF01BD63),
                        elevation: 4,
                        child: Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.ev_station,
                                  size: 50,
                                  color: Colors.white,
                                )),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                "Oil Changes at Regular intervals\nhave shown upto 10% savings on\nfuel consumption.",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                            )
                          ],
                        )))
        ],
      )),
      ]),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTask()));
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Card(
                      color: Color(0xFF8BBEE8),
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
                    MaterialPageRoute(builder: (context) => AddTask()));
              },
              child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Card(
                      color: Color(0xFF8BBEE8),
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
