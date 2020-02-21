import 'package:flutter/material.dart';
import 'package:todo/models/note.dart';
import 'package:todo/utils/database_helper.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  final Note note;
  AddTask(this.note);
  @override
  _AddTaskState createState() => _AddTaskState(this.note);
}

class _AddTaskState extends State<AddTask> {
  DatabaseHelper helper = DatabaseHelper();
  Note note;
  _AddTaskState(this.note);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
                  moveToLastScreen();
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
                    child: TextField(
                      controller: titleController,
                      onChanged: (value) {
                        updateTitle();
                      },
                      style: TextStyle(color: Colors.white, fontSize: 30),
                      decoration: InputDecoration.collapsed(
                        hintText: "Title",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    )),
                Container(
                  height: (0.2) * h,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: TextField(
                        controller: descriptionController,
                        onChanged: (value) {
                          updateDescription();
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        decoration: InputDecoration.collapsed(
                          hintText: "Description",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            _save();
          });
        },
        child: Icon(
          Icons.done_all,
          color: Colors.white,
          size: 20,
        ),
      ),
    ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateDescription() {
    note.description = descriptionController.text;
  }

  void updateTitle() {
    note.title = titleController.text;
  }

  void _save() async {
    moveToLastScreen();

    note.date = DateFormat.yMMMd().format(DateTime.now());
    note.favourite = 0;
    print(note);
    int result;
    if (note.id != null) {
      // Case 1: Update operation
      result = await helper.updateNote(note);
    } else {
      // Case 2: Insert Operation
      result = await helper.insertNote(note);
    }
    if (result != 0) {
      // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }
}
