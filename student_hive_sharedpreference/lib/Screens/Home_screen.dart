import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:student_hive_sharedpreference/Screens/login_screen.dart';
import 'package:student_hive_sharedpreference/functions.dart';
import 'Update.dart';
import 'student_profile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final studentDb = Provider.of<StudentDbProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        actions: [
          IconButton(
            onPressed: () async {
              final sh = await SharedPreferences.getInstance();
              await sh.setBool('islogged', false);
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const Login()));
            },
            icon: const Icon(Icons.logout),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: (value) => studentDb.searchStudents(value),
              decoration: const InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
              ),
            ),
          ),
        ),
      ),
      body: Consumer<StudentDbProvider>(
        builder: (context, provider, child) {
          if (provider.students.isEmpty) {
            return const Center(child: Text('No records yet'));
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              final student = provider.students[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: student.imagePath.isNotEmpty
                      ? FileImage(File(student.imagePath))
                      : null,
                  child: student.imagePath.isEmpty
                      ? const Icon(Icons.person)
                      : null,
                ),
                title: Text(student.name),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) =>
                          StudentProfile(studentIndex: index)));
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: provider.students.length,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const AddEditStudentScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}