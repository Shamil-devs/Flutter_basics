import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'student.dart';

class Studenthome extends StatefulWidget {
  const Studenthome({super.key});

  @override
  State<Studenthome> createState() => _StudenthomeState();
}

class _StudenthomeState extends State<Studenthome> {
  final _name=TextEditingController();
  final _roll=TextEditingController();
  final _sub=TextEditingController();

  void _form(){
    showDialog(context: context, builder: (_){
      return AlertDialog(
        title: Text('Add student'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _name,decoration: InputDecoration(labelText: 'Name',border: UnderlineInputBorder()),),
            TextField(controller: _roll,decoration: InputDecoration(labelText: 'Roll number',border: UnderlineInputBorder()),),
            TextField(controller: _sub,decoration: InputDecoration(labelText: 'Subject',border: UnderlineInputBorder()),),
          ],
        ),
        actions: [
          TextButton(onPressed: ()=>Navigator.of(context).pop(), child: Text('Cancel')),
          ElevatedButton(onPressed: () {
            final studentbox=Hive.box<student>('Students');
            studentbox.add(student(name: _name.text, rollno: int.parse(_roll.text), subject: _sub.text));
            _name.clear();
            _roll.clear();
            _sub.clear();
            Navigator.of(context).pop();
          } , child: Text('Add'))
        ],
      );

    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(valueListenable: Hive.box<student>('Students').listenable(),
          builder: (context,Box<student> box,_) {
            if (box.values.isEmpty) {
              return const Center(child: Text('No students yet'),);
            }
            return ListView.builder(
                itemCount: box.values.length,
                itemBuilder: (context, index) {
                  final Students = box.getAt(index)!;
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(Students.name, style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),),
                      subtitle: Text(
                        'Age:${Students.rollno} | Subject:${Students.subject}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),),
                      trailing: IconButton(onPressed: () => box.deleteAt(index),
                          icon: Icon(Icons.delete, color: Colors.red,)),
                    ),
                  );
                }
            );
          }
          ),

      floatingActionButton: FloatingActionButton(onPressed: _form , child: const Icon(Icons.add,color: Colors.deepPurpleAccent,),),

    );
  }
}
