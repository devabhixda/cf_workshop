import 'package:flutter/material.dart';
import 'package:todo/AddTask.dart';
import 'package:todo/Done.dart';
import 'package:todo/models/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/utils/database_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

double h, w;

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;
  bool sync = false;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    print(noteList);
    if (noteList == null || sync) {
      sync = false;
      noteList = List<Note>();
      updateListView();
    }
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
                child: getFavouritesListView()),
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
                child: getNoteListView()),
          ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () async {
          sync = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddTask(Note('', '', 0))));
        },
      ),
    ));
  }

  ListView getNoteListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Container(
            margin: EdgeInsets.only(left: 10),
            width: (0.4) * w,
            child: Card(
              elevation: 2,
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Container(
                    height: (0.26) * h,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            this.noteList[position].title,
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            this.noteList[position].description,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.done_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          print("Pressed");
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          _delete(context, noteList[position]);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.star_border,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          _setFavourite(context, noteList[position]);
                        },
                      )
                    ],
                  ))
                ],
              ),
            ),
          );
        });
  }

  ListView getFavouritesListView() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return this.noteList[position].favourite == 1 ? Container(
            margin: EdgeInsets.only(left: 10),
            width: (0.5) * w,
            child: Card(
              elevation: 2,
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Container(
                    height: (0.13) * h,
                    child: Text(
                      this.noteList[position].title,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: (0.3) * w),
                    child: IconButton(
                        icon: Icon(
                          Icons.done_outline,
                          size: 20,
                          color: Colors.white,
                        ),
                        onPressed: null),
                  )
                ],
              ),
            ),
          ) : Container();
        });
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelper.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Task Deleted Successfully');
      updateListView();
    }
  }

  void _setFavourite(BuildContext context, Note note) async {
    note.favourite=1;
    int result = await databaseHelper.updateNote(note);
    if (result != 0) {
      _showSnackBar(context, 'Task Marked Favourite');
      updateListView();
    }
  }

  void _setCompleted(BuildContext context, Note note) async {
    note.completed = 1;
    note.favourite = 0;
    int result = await databaseHelper.updateNote(note);
    if (result != 0) {
      _showSnackBar(context, 'Task Marked Complete');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.black,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
