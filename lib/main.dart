import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(MaterialApp(
    title: "To Do App",
    theme: ThemeData(
      primarySwatch: Colors.lightGreen,
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: 'homepage',
    routes: {
      'homepage' : (context) => HomePage(),
    },
  ));
}