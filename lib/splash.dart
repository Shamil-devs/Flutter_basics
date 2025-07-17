import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  @override
  _splashstate createState()=> _splashstate();

}
class _splashstate extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>LoginScreen()))
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
        child: Text("Prepare For Trial",style: TextStyle(fontSize: 24)),
      )
    );
  }
}