//import 'dart:ffi';

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddStudent extends StatefulWidget {
  Function studentfunction;
  AddStudent(this.studentfunction, {super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phycontroller = TextEditingController();
  final TextEditingController chemcontroller = TextEditingController();
  final TextEditingController mathcontroller = TextEditingController();

  final TextEditingController totcontroller = TextEditingController();
  final TextEditingController percontroller = TextEditingController();
  final TextEditingController gradecontroller = TextEditingController();

  double per = 0;
  int total = 0, phy = 0, chem = 0, math = 0;
  String grade = '';
  int roll = 0;

  Future<void> addstudent(String name, int phy, int chem, int math, int total,
      String grade, double percentage, int roll) async {
    CollectionReference Student =
        FirebaseFirestore.instance.collection('studentCollection');

    var docRef = await Student.add({
      'name': name,
      'phy': phy,
      'chem': chem,
      'math': math,
      'total': total,
      'grade': grade,
      'percentage': percentage,
      'roll': roll,
    });

    widget.studentfunction(
      namecontroller.text,
      int.parse(phycontroller.text),
      int.parse(chemcontroller.text),
      int.parse(mathcontroller.text),
      total,
      grade,
      per,
      roll,
      docRef.id.toString(),
    );
  }

  void rollfun() {
    roll = roll + 1;
    print(roll);
  }

  void gradefun() {
    if (per >= 90) {
      grade = 'A';
    } else if (per >= 80) {
      grade = 'B';
    } else if (per >= 70) {
      grade = 'C';
    } else if (per >= 60) {
      grade = 'D';
    } else if (per >= 50) {
      grade = 'E';
    } else {
      grade = 'Fail';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add student info')),
      body: ListView(children: [
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
              controller: phycontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'phy marks',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: chemcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'chem marks',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: mathcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'math marks',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: totcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Total marks',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: percontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Percentages',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: gradecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Grade',
              ),
            )),
        ElevatedButton(
            onPressed: () {
              if (phycontroller.text.length > 0 &&
                  chemcontroller.text.length > 0 &&
                  mathcontroller.text.length > 0) {
                phy = int.parse(phycontroller.text);
                math = int.parse(mathcontroller.text);
                chem = int.parse(chemcontroller.text);

                total = phy + chem + math;
                per = total / 3;

                // roll = roll + 1;
                // print(roll);

                gradefun();

                setState(() {
                  totcontroller.text = total.toString();
                  percontroller.text = per.toString();
                  gradecontroller.text = grade;
                });

                print(total);
                print(per);
              }
            },
            child: Text("calculate"))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            rollfun();
            addstudent(
                namecontroller.text,
                int.parse(phycontroller.text),
                int.parse(chemcontroller.text),
                int.parse(mathcontroller.text),
                total,
                grade,
                per,
                Random().nextInt(100));

            Get.back();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
