import 'package:flutter/material.dart';
import 'package:todo/HomeScreen.dart';

void main() => runApp(Todo());

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      routes: {
      },
    );
  }
}