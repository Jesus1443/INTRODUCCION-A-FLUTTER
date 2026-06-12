import 'package:flutter/material.dart';
import 'screens/counter/counter.dart';
void main() {
  runApp(MyApp());
  
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App',
      home: Counter(),
    );
  }
}





