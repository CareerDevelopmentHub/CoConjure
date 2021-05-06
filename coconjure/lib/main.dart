import 'package:coconjure/Screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:coconjure/contants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: HomeScreen(),
    );
  }
}
