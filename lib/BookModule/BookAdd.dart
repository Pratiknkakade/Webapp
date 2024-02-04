import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BookAdd extends StatefulWidget {
  Function booklistfunction;
  BookAdd(this.booklistfunction, {super.key});

  @override
  State<BookAdd> createState() => _BookAddState();
}

class _BookAddState extends State<BookAdd> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController authercontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController bookidcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();

  String dateErrorText = '';

  Future<void> addbook(
      String name, String auther, int price, int bookid, int date) async {
    CollectionReference insertbook =
        FirebaseFirestore.instance.collection('BookCollection');

    var docRef = await insertbook.add({
      'name': name,
      'auther': auther,
      'price': price,
      'bookid': bookid,
      'date': date,
    });

    widget.booklistfunction(
      namecontroller.text,
      authercontroller.text,
      int.parse(pricecontroller.text),
      bookid,
      int.parse(datecontroller.text),
      docRef.id.toString(),
    );
  }

  void validatedate(String input) {
    final dob = DateTime.parse(input);
    final currentdate = DateTime.now();
    print(currentdate);
    if (dob != currentdate) {
      setState(() {
        dateErrorText = 'date must be current time';
      });
    } else {
      setState(() {
        dateErrorText = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add book info')),
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
              controller: authercontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'auther name',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: pricecontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'price ',
              ),
            )),
        Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: datecontroller,
            onChanged: validatedate,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: ' current date(YYYY-MM-DD)',
              errorText: dateErrorText.isNotEmpty ? dateErrorText : null,
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            addbook(
              namecontroller.text,
              authercontroller.text,
              int.parse(pricecontroller.text),
              Random().nextInt(100),
              int.parse(datecontroller.text),
            );

            Get.back();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
