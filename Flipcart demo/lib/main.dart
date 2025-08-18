import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flipkart',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      SafeArea(child:
      ListView(
        children: [
          _bar(),
        ]
      ),
      ),
    );
  }
}
Widget _bar(){
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
    child: Row(
    children: [
      Expanded(child: ElevatedButton(onPressed: (){},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
        ),
      child: Row(
        children: [
          Icon(CupertinoIcons.f_cursive,color: Colors.yellow,size: 30,),
          Text("Flipkart")
        ],
      ))),
      SizedBox(width: 10,),
      Expanded(child: ElevatedButton(onPressed: (){},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          child: Row(
        children: [
          Icon(CupertinoIcons.bag_fill),
          Text('Grocery',textAlign: TextAlign.center,)
        ],
      )))
    ],
    ),
  );
}