import 'package:hive_flutter/hive_flutter.dart';
import 'student_model.dart';
import 'package:flutter/foundation.dart';

class StudentDbProvider with ChangeNotifier {
  static const String _boxName = 'studentBox';
  List<Student> _students = [];
  List<Student> _filteredStudents = [];

  List<Student> get students => _filteredStudents;

  StudentDbProvider() {
    loadStudents();
  }

  Future<void> loadStudents() async {
    final box = await Hive.openBox<Student>(_boxName);
    _students = box.values.toList();
    _filteredStudents = _students;
    notifyListeners();
  }

  Future<void> addStudent(Student student) async {
    final box = await Hive.openBox<Student>(_boxName);
    await box.add(student);
    loadStudents();
  }

  Future<void> updateStudent(int index, Student student) async {
    final box = await Hive.openBox<Student>(_boxName);
    await box.putAt(index, student);
    loadStudents();
  }

  Future<void> deleteStudent(int index) async {
    final box = await Hive.openBox<Student>(_boxName);
    await box.deleteAt(index);
    loadStudents();
  }

  void searchStudents(String query) {
    if (query.isEmpty) {
      _filteredStudents = _students;
    } else {
      _filteredStudents = _students
          .where((student) =>
          student.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}