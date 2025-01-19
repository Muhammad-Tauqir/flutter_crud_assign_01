import 'package:flutter/material.dart';

class Shome extends StatefulWidget {
  const Shome({super.key});

  @override
  State<Shome> createState() => _ShomeState();
}

class _ShomeState extends State<Shome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Todo")),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}