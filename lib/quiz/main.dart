import 'package:flutter/material.dart';
import 'quiz_screen.dart';

void main() {
  runApp(const MyQuizApp());
}

class MyQuizApp extends StatelessWidget {
  const MyQuizApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: QuizScreen());
  }
}
