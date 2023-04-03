import 'package:bmi_animator/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Home(),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => myApp(),
      },
    );
  }
}
