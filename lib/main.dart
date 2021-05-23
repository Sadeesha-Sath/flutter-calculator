import 'package:flutter/material.dart';
import 'package:flutter_calculator/constants.dart';
import 'package:flutter_calculator/ui/calculator_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project 1",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
        backgroundColor: Colors.lightBlueAccent.shade700,
      ),
      backgroundColor: kBackgroundColor,
      body: CalculatorView(),
    );
  }
}
