import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateEmployee extends StatefulWidget {
  String id;
  UpdateEmployee(this.id, {super.key});

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController empidcontroller = TextEditingController();
  final TextEditingController postcontroller = TextEditingController();
  final TextEditingController salarycontroller = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> Employeesupdate(
      String name, int empid, int salary, String post, String id) async {
    FirebaseFirestore.instance.collection('employeecolection').doc(id).update({
      'name': name,
      'empid': empid,
      'post': post,
      'salary': salary,
      'status': true,
    });
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('employeecolection');

    return Scaffold(
      appBar: AppBar(title: const Text('update EMPLOYEE')),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(widget.id).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            //  return Text("Full Name: ${data['name']} ${data['last_name']}");

            namecontroller.text = data['name'];
            namecontroller.text = data['name'];
            postcontroller.text = data['post'];
            empidcontroller.text = data['empid'].toString();
            salarycontroller.text = data['salary'].toString();
            return Column(children: [
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
            ]);
          }

          return Text("loading");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Employeesupdate(
                namecontroller.text,
                int.parse(empidcontroller.text),
                int.parse(salarycontroller.text),
                postcontroller.text,
                widget.id);

            Get.back();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
