
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flipkart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  int _counter=0;
  void _add(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter',)),
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You pushed",style: TextStyle(fontSize: 20),),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: Colors.white),
              child: Text('$_counter',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _add,tooltip: 'Incement',child: Icon(Icons.add,color: Colors.white,)),
    );
  }
}


