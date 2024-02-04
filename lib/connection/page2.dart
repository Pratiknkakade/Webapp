import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:webapp/page2.dart';
//import 'package:get/get.dart';

// ignore: camel_case_types
class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page1State();
}

// ignore: camel_case_types
class _page1State extends State<page2> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  Future<void> addStud(String name, String age) async {
    CollectionReference stud = FirebaseFirestore.instance.collection('stud');

    await stud.add({
      'name': name,
      'age': age,
    });
  }

  String age = '';
  String name = '';
  String nameErrorText = '';

  @override
  void dispose() {
    nameController.dispose();
  }

  void validateName(String input) {
    if (input.length <= 5) {
      setState(() {
        nameErrorText = 'Name must be greater than 5 characters';
      });
    } else {
      setState(() {
        nameErrorText = '';
      });
    }
  }

  void valideAge() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('page2'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  onChanged: (validateName) {
                    setState(() {
                      name = validateName;
                    });
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Name',
                      errorText:
                          nameErrorText.isNotEmpty ? nameErrorText : null),
                )),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: ageController,
                onChanged: (valideAge) {
                  setState(() {
                    age = valideAge;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'age',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  addStud(nameController.text, ageController.text);

                  Navigator.pop(context);

                  // Get.to(page2());
                },
                child: const Text('go to page 1'))
          ],
        ),
      ),
    );
  }
}
