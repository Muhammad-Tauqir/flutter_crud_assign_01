import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

LinearGradient bgColor() {
  return LinearGradient(colors: [Color(0xff4facfe), Color(0xff00f2fe)]);
}

dynamic database() {
  final DatabaseReference database = FirebaseDatabase.instance.ref().child('tasks');

  return database;
}
