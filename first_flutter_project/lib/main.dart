import 'package:first_flutter_project/second_file.dart';
import 'package:flutter/material.dart';

void main() =>  runApp( MyClass());


class MyClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My flutter app',
      home: Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: SecondClass() 
      )
    );
  }
}
