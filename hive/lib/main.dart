import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_crud/student.dart';
import 'Studenthome.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(studentAdapter());
  await Hive.openBox<student>('Students');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purpleAccent),
      home: Studenthome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
