import 'dart:convert';
import 'package:flutter/material.dart';
import 'student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  // Application state: list of students
  final List<Student> students = [];
  final TextEditingController nameController = TextEditingController();
  String lastJson = '';

  void addStudent() {
    if (nameController.text.isEmpty) return;

    Student student = Student(
      id: students.length + 1,
      name: nameController.text,
      course: 'CSE',
    );

    // Serialization: object -> JSON
    Map<String, dynamic> data = student.toJson();
    String jsonString = jsonEncode(data);
    print(jsonString);

    // Deserialization: JSON -> object
    Student newStudent = Student.fromJson(jsonDecode(jsonString));
    print(newStudent.name);

    setState(() {
      students.add(newStudent);
      lastJson = jsonString;
    });
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State & JSON Serialization'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Reg No: URK23CS1299',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addStudent,
                child: const Text('Add Student'),
              ),
            ),
            const SizedBox(height: 8),
            if (lastJson.isNotEmpty) Text('JSON: $lastJson'),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('${students[index].id}')),
                    title: Text(students[index].name),
                    subtitle: Text(students[index].course),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
