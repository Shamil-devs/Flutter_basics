import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(demo());
}
class demo extends StatelessWidget{
  const demo ({Key? key}) : super(key:key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0x00FFFF)),
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  void popup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("How you doin??"),
          content: const Text("I said don't click"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(title: const Text("Hey App")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => popup(context),
          child: const Text("Don't click"),
        ),
      ),
    );
  }
}