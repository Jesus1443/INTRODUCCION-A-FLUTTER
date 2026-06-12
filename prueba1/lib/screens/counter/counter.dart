import 'package:flutter/material.dart';
import 'package:prueba1/custom/custom_button.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _MyAppState();
}

class _MyAppState extends State<Counter> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        centerTitle: true),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter', style: TextStyle(
                fontSize: 160,
                fontWeight: FontWeight.w100),
                ),
              Text(
                clickCounter == 1 ? 'Click' : 'Clicks',
                style: TextStyle(fontSize: 25
                ),
              ),
            ],
            )
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                icon: Icons.plus_one,
                onPressed: (){
                  setState((){
                    clickCounter++;
                  });
                },
              ),
              const SizedBox(height: 10),
              CustomButton(
                icon: Icons.restart_alt,
                onPressed: (){                
                  setState((){
                    clickCounter = 0;
                  });
                },
                
              ),
              const SizedBox(height: 10),
              CustomButton(
                icon: Icons.exposure_minus_1,
                onPressed: (){
                  if(clickCounter <= 0) return;
                  setState((){
                    clickCounter--;
                  });
                },
                
              ),
              const SizedBox(height: 10),
            ],)
      );
  }
}

