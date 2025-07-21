import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/login.dart';

class Home extends StatelessWidget{
  final List<String>  items=['1','2','3','4'];

  void _logout(BuildContext context){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_)=>LoginScreen()),
        (route)=>false
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(onPressed: ()=>_logout(context), icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context,index)=>ListTile(
            title: Text(items[index]),
          )),
    );
  }
}