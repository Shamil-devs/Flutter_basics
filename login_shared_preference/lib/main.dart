
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_shared_preference/login.dart';
import 'home.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sh=await SharedPreferences.getInstance();
  final bool islogged=sh.getBool('islogged')?? false;

  runApp(login(islogged:islogged));
}

class login extends StatelessWidget {
  final bool islogged;
  const login({super.key,required this.islogged});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: islogged ? const home() :const logginin(),
    );
  }
}
