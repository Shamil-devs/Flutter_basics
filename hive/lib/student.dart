import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'student.g.dart';

@HiveType(typeId:1)
class student{
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int rollno;

  @HiveField(2)
  final String subject;

  student({required this.name, required this.rollno, required this.subject});
}