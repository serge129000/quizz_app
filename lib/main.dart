// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizz_app/pages/frontend/index.dart';

void main(List<String> args) {
  runApp(const QuizzApp());
}

class QuizzApp extends StatelessWidget {
  const QuizzApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quizz App",
      debugShowCheckedModeBanner: false,
      home: Index(),
    );
  }
}
