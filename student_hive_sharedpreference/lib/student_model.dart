import 'package:hive_flutter/hive_flutter.dart';
part 'student_model.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String imagePath;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String studentClass;

  @HiveField(4)
  final String address;

  Student({
    required this.name,
    required this.age,
    required this.studentClass,
    required this.address,
    required this.imagePath,
  });
}