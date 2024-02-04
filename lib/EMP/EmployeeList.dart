import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/EMP/AddEmployee.dart';
import 'package:webapp/EMP/UpdateEmployee.dart';
//import 'EmployeeClass.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('employeecolection').snapshots();

  Future<void> updateStatus(bool val, String id) async {
    FirebaseFirestore.instance.collection('employeecolection').doc(id).update({
      'status': val,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text('Employe list ')),
          body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return InkWell(
                    onLongPress: () {
                      setState(() {
                        deleteFromDataBase(document.id.toString());
                        data.remove(data);
                      });
                    },
                    onTap: () {
                      setState(() {
                        Get.to(UpdateEmployee(document.id.toString()));
                      });
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                          child: Text(
                        data['empid'].toString(),
                        style: const TextStyle(fontSize: 10),
                      )),
                      title: Text(data['name']),
                      subtitle: Text(data['post']),
                      trailing: Switch(
                        // This bool value toggles the switch.
                        value: data['status'],
                        activeColor: Colors.black,
                        onChanged: (bool val) {
                          updateStatus(val, document.id.toString());
                        },
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddEmployee());
            },
            child: const Icon(Icons.add),
          )),
    );
  }

  void deleteFromDataBase(String id) async {
    FirebaseFirestore.instance.collection("employeecolection").doc(id).delete();
  }
}























// void deleteFromDataBase(String id) async {
//   FirebaseFirestore.instance.collection("employeecolection").doc(id).delete();
// }





















  // void addemployeefun(
  //     String ename, int esalary, String epost, int eid, String docId) {
  //   setState(() {
  //     employee.add(EmployeeClass(
  //         name: ename, salary: esalary, post: epost, empid: eid, id: docId));
  //   });
  // }

  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   fetchData();
  // }

  // fetchData() async {
  //   QuerySnapshot querySnapshot =
  //       await firestore.collection('employeecolection').get();
  //   for (var doc in querySnapshot.docs) {
  //     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //     String name = data['name'];
  //     int salary = data['salary'];
  //     int empid = data['empid'];
  //     String post = data['post'];
  //     String id = doc.id.toString();
  //     EmployeeClass obj1 = EmployeeClass(
  //       empid: empid,
  //       name: name,
  //       post: post,
  //       salary: salary,
  //       id: id,
  //     );
  //     employee.add(obj1);
  //   }
  //   setState(() {});
  // }