import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_hive_sharedpreference/functions.dart';
import 'package:student_hive_sharedpreference/student_model.dart';
import 'image_picker.dart';

import 'package:provider/provider.dart';

class AddEditStudentScreen extends StatefulWidget {
  final int? studentIndex;
  const AddEditStudentScreen({super.key, this.studentIndex});

  @override
  State<AddEditStudentScreen> createState() => _AddEditStudentScreenState();
}

class _AddEditStudentScreenState extends State<AddEditStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _classController = TextEditingController();
  final _addressController = TextEditingController();
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    if (widget.studentIndex != null) {
      final studentDb = Provider.of<StudentDbProvider>(context, listen: false);
      final student = studentDb.students[widget.studentIndex!];
      _nameController.text = student.name;
      _ageController.text = student.age;
      _classController.text = student.studentClass;
      _addressController.text = student.address;
      _imagePath = student.imagePath;
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.studentIndex == null ? 'Add Student' : 'Edit Student'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ImagePickerWidget(
                imagePath: _imagePath,
                onImagePicked: (path) {
                  setState(() {
                    _imagePath = path;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'Please enter an age' : null,
              ),
              TextFormField(
                controller: _classController,
                decoration: const InputDecoration(labelText: 'Class'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a class' : null,
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter an address' : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _imagePath != null) {
                    final student = Student(
                      imagePath: _imagePath!,
                      name: _nameController.text,
                      age: _ageController.text,
                      studentClass: _classController.text,
                      address: _addressController.text,
                    );
                    final studentDb =
                    Provider.of<StudentDbProvider>(context, listen: false);
                    if (widget.studentIndex == null) {
                      studentDb.addStudent(student);
                    } else {
                      studentDb.updateStudent(widget.studentIndex!, student);
                    }
                    Navigator.of(context).pop();
                  } else if (_imagePath == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select an image')),
                    );
                  }
                },
                child: Text(widget.studentIndex == null ? 'Save' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}