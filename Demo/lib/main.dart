

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Intern());
}

class Intern extends StatelessWidget {
  const Intern({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            

            child: Text("Bridgeon",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
            )),
          ),

          Container(

          )
        ],
      ),
    );;
  }
}
