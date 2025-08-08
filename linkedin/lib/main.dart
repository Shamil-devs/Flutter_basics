

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Linkedin());
}

class Linkedin extends StatelessWidget {
  const Linkedin({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Linkedin",
      home: Home(),
    );
  }
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(
        children: [
          _topbar(),
          const Divider(height: 1,color: Colors.indigo,)
        ],
      )
      ),
    );
  }
}
Widget _topbar(){
  return Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage('https://www.google.com/imgres?q=zoro&imgurl=https%3A%2F%2Fi.pinimg.com%2F736x%2F2b%2Fbc%2F47%2F2bbc47578113791e42e1063d39acd9e3.jpg&imgrefurl=https%3A%2F%2Fin.pinterest.com%2Fpin%2Froronoa-zoro-wallpaper-one-piece-zoro--31525266135908493%2F&docid=QOBtUA742N_6lM&tbnid=x4nnsefYmDVe1M&vet=12ahUKEwjurf3Uv_qOAxUXUWwGHW7HCEMQM3oECBoQAA..i&w=736&h=1308&hcb=2&ved=2ahUKEwjurf3Uv_qOAxUXUWwGHW7HCEMQM3oECBoQAA'),
          radius: 20,
        ),
        SizedBox(width: 10,),
        Expanded(
            child:Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              height: 36,

              decoration: BoxDecoration(color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,

              )),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10,),
                  const Text('Search')
                ],
              ),

            ),
        ),
        SizedBox(width:10),
        Icon(Icons.message)

          

      ],
    ),


  );
}

