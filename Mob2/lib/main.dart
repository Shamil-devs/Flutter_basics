import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(mob2());
}
class mob2 extends StatelessWidget{
  const mob2({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
    home:Home(),
    );
  }
}

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState()=> _HomeState();

}
class _HomeState extends State<Home> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  int res = 0;

  void Add() {
    int n1 = int.tryParse(num1.text) ?? 0;
    int n2 = int.tryParse(num2.text) ?? 0;
    setState(() {
      res = n1 + n2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sum it up")),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: num1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Enter first number:"),

              ),
              TextField(
                  controller: num2,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Enter Second Number")
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: Add,
                  child: Text("Add")
              ),
              SizedBox(height: 20),
              Text(
                "Result:$res",
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
      ),
    );
  }
}