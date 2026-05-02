import 'package:first_flutter_project/screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() =>  runApp( MyClass());


class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My flutter app',
      home: Scaffold(
        body: SecondClass() 
      )
    );
  }
}
