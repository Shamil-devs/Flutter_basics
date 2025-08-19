import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_hive_sharedpreference/functions.dart';
import 'Update.dart';
import 'package:provider/provider.dart';

class StudentProfile extends StatelessWidget {
  final int studentIndex;
  const StudentProfile({super.key, required this.studentIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (_) => AddEditStudentScreen(studentIndex: studentIndex),
              ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Confirm Deletion'),
                  content:
                  const Text('Are you sure you want to delete this student?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Provider.of<StudentDbProvider>(context, listen: false)
                            .deleteStudent(studentIndex);
                        Navigator.of(context)
                          ..pop()
                          ..pop(); // Pop dialog and profile screen
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<StudentDbProvider>(
        builder: (context, provider, child) {
          final student = provider.students[studentIndex];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(File(student.imagePath)),
                  ),
                ),
                const SizedBox(height: 20),
                Text('Name: ${student.name}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Age: ${student.age}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Class: ${student.studentClass}',
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                Text('Address: ${student.address}',
                    style: const TextStyle(fontSize: 20)),
              ],
            ),
          );
        },
      ),
    );
  }
}