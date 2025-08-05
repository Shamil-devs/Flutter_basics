
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Demo());
}

class Demo extends StatelessWidget{
  const Demo({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'DEMO',
      home:Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
      body:SafeArea(
      child : Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text(
            "Welcome",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end ,
            children: [
              TextButton(onPressed: (){}, child: Text("Click me")),
              ElevatedButton(onPressed: (){}, child: Text("Hi")),
            ],
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm_outlined)),
          ],
        ),
      ) ,
      )
    );
  }
}
