import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:webapp/page1.dart';
import 'package:webapp/connection/page2.dart';

class Student {
  String name;
  int age;
  Student({required this.name, required this.age});
}

class page1 extends StatefulWidget {
  const page1({super.key});

  @override
  State<page1> createState() => _page2State();
}

class _page2State extends State<page1> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Student> studentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  fetchData() async {
    QuerySnapshot querySnapshot = await firestore.collection('students').get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String name = data['name'];
      int age = data['age'];
      Student obj1 = Student(name: name, age: age);
      studentList.add(obj1);
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page1 (list)'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const page2()),
        );
      }),
      body: ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(studentList[index].name),
            subtitle: Text('Age: ${studentList[index].age}'),
          );
        },
      ),
    );
  }
}
