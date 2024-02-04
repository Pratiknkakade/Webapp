//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/StudentFoder/StudentClass.dart';

// ignore: must_be_immutable
class Showdetails extends StatefulWidget {
  StudentClass ss;
  Function updateStudent;
  int index;
  Showdetails(this.ss, this.index, this.updateStudent, {super.key});

  @override
  State<Showdetails> createState() => _ShowdetailsState();
}

class _ShowdetailsState extends State<Showdetails> {
  final TextEditingController namecontrolle = TextEditingController();
  final TextEditingController phycontrolle = TextEditingController();
  final TextEditingController chemcontrolle = TextEditingController();
  final TextEditingController mathcontrolle = TextEditingController();

  final TextEditingController totcontrolle = TextEditingController();
  final TextEditingController percontrolle = TextEditingController();
  final TextEditingController gradecontrolle = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {
      namecontrolle.text = widget.ss.name;
      phycontrolle.text = widget.ss.phy.toString();
      mathcontrolle.text = widget.ss.math.toString();
      chemcontrolle.text = widget.ss.chem.toString();
      totcontrolle.text = widget.ss.total.toString();
      percontrolle.text = widget.ss.percentage.toString();
      gradecontrolle.text = widget.ss.grade;
    });
  }

  double per = 0;
  int total = 0, phy = 0, chem = 0, math = 0;
  String grade = '';
  int roll = 0;

  Future<void> updatestudent(String name, int phy, int chem, int math,
      int total, String grade, double percentage, int roll, String id) async {
    FirebaseFirestore.instance.collection('studentCollection').doc(id).update({
      'name': name,
      'phy': phy,
      'chem': chem,
      'math': math,
      'total': total,
      'grade': grade,
      'percentage': percentage,
      'roll': roll,
    });
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
      appBar: AppBar(title: Text('update student info')),
      body: ListView(children: [
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: namecontrolle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: phycontrolle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'phy marks',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: chemcontrolle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'chem marks',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: mathcontrolle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'math marks',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: totcontrolle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Total marks',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: percontrolle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Percentages',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: gradecontrolle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Grade',
              ),
            )),
        ElevatedButton(
            onPressed: () {
              if (phycontrolle.text.length > 0 &&
                  chemcontrolle.text.length > 0 &&
                  mathcontrolle.text.length > 0) {
                phy = int.parse(phycontrolle.text);
                math = int.parse(mathcontrolle.text);
                chem = int.parse(chemcontrolle.text);

                total = phy + chem + math;
                per = total / 3;

                // roll = roll + 1;
                // print(roll);

                gradefun();

                setState(() {
                  totcontrolle.text = total.toString();
                  percontrolle.text = per.toString();
                  gradecontrolle.text = grade;
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
            // widget.student.chem = chemcontrolle;
            // widget.student.math = mathcontrolle;

            StudentClass s = StudentClass(
                name: namecontrolle.text,
                phy: int.parse(phycontrolle.text),
                chem: int.parse(chemcontrolle.text),
                math: int.parse(mathcontrolle.text),
                total: int.parse(totcontrolle.text),
                grade: gradecontrolle.text,
                percentage: double.parse(percontrolle.text),
                roll: roll,
                id: widget.ss.id);

            widget.updateStudent(s, widget.index);

            updatestudent(namecontrolle.text, phy, chem, math, total, grade,
                double.parse(percontrolle.text), roll, widget.ss.id);

            Get.back();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
