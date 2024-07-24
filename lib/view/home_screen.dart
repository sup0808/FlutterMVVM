import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter MVVM"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(fontSize: 30),
      ),
      body: Text("Home Screen"),
    );
  }
}
