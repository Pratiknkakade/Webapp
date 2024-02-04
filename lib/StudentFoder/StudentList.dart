import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/StudentFoder/AddStudent.dart';
import 'package:webapp/StudentFoder/Showdetails.dart';
import 'package:webapp/StudentFoder/StudentClass.dart';
import 'package:webapp/connection/page1.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<StudentClass> student = [];

  void studentfunction(String sname, int sphy, int schem, int smath, int stotal,
      String sgrade, double spercentage, int sroll, String docId) {
    setState(() {
      student.add(StudentClass(
        name: sname,
        phy: sphy,
        chem: schem,
        math: smath,
        total: stotal,
        grade: sgrade,
        percentage: spercentage,
        roll: sroll,
        id: docId,
      ));
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    QuerySnapshot querySnapshot =
        await firestore.collection('studentCollection').get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String name = data['name'];
      int phy = data['phy'];
      int chem = data['chem'];
      int math = data['math'];
      int total = data['total'];
      String grade = data['grade'];
      double percentage = data['percentage'];
      int roll = data['roll'];
      String id = doc.id.toString();

      //String id = doc.id.toString();
      StudentClass obj1 = StudentClass(
        name: name,
        phy: phy,
        chem: chem,
        math: math,
        total: total,
        grade: grade,
        percentage: percentage,
        roll: roll,
        id: id,
      );

      student.add(obj1);
    }
    setState(() {});
  }

  void updateStudent(StudentClass s, int index) {
    setState(() {
      student[index] = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Student list')),
        body: Container(
          child: ListView.builder(
              itemCount: student.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    setState(() {
                      deleteFromDataBase(student[index].id);
                      student.remove(student[index]);
                    });
                  },
                  onTap: () {
                    setState(() {
                      Get.to(Showdetails(student[index], index, updateStudent));
                    });
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(
                      student[index].roll.toString(),
                      style: TextStyle(fontSize: 10),
                    )),
                    title: Text(student[index].name),
                    subtitle: Text('percentage : ${student[index].percentage}'),
                    trailing: Text(student[index].grade.toString()),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddStudent(studentfunction));
          },
          child: const Icon(Icons.add),
        ));
  }

  void deleteFromDataBase(String id) async {
    FirebaseFirestore.instance.collection("studentCollection").doc(id).delete();
  }
}
