// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEmployee extends StatefulWidget {
  // Function addemployeefun;
  const AddEmployee({super.key});

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController empidcontroller = TextEditingController();
  final TextEditingController postcontroller = TextEditingController();
  final TextEditingController salarycontroller = TextEditingController();

  Future<void> addEmployees(
      String name, int empid, int salary, String post) async {
    CollectionReference employee =
        FirebaseFirestore.instance.collection('employeecolection');

    // var docRef = await
    employee.add({
      'name': name,
      'empid': empid,
      'post': post,
      'salary': salary,
      'status': true,
    });
  }

  @override
  void dispose() {
    namecontroller.dispose();
    empidcontroller.dispose();
    salarycontroller.dispose();
    postcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ADD EMPLOYEE')),
      body: Column(children: [
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: namecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            )),
        Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: empidcontroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'empid',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: postcontroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'post',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: salarycontroller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'salary',
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            addEmployees(namecontroller.text, int.parse(empidcontroller.text),
                int.parse(salarycontroller.text), postcontroller.text);

            Get.back();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
