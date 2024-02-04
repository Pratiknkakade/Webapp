import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/BookModule/Book.dart';

// ignore: must_be_immutable
class BookUpdate extends StatefulWidget {
  Book object;
  Function updatefunction;
  int index;
  BookUpdate(this.object, this.index, this.updatefunction, {super.key});

  @override
  State<BookUpdate> createState() => _BookUpdateState();
}

class _BookUpdateState extends State<BookUpdate> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController authercontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController bookidcontroller = TextEditingController();
  final TextEditingController datecontroller = TextEditingController();

  String dateErrorText = '';
  int price = 0, date = 0, bid = 0;

  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      namecontroller.text = widget.object.name;
      authercontroller.text = widget.object.auther;
      pricecontroller.text = widget.object.price.toString();
      bookidcontroller.text = widget.object.bookid.toString();
      datecontroller.text = widget.object.date.toString();
    });
  }

  Future<void> booklistupdate(String name, String auther, int price, int bookid,
      int date, String id) async {
    FirebaseFirestore.instance.collection('BookCollection').doc(id).update({
      'name': name,
      'auther': auther,
      'price': price,
      'bookid': bookid,
      'date': date,
    });
  }

  void validatedate(String input) {
    final dob = DateTime.parse(input);
    final currentdate = DateTime.now();

    if (dob.isAfter(currentdate)) {
      setState(() {
        dateErrorText = 'date must be current ';
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
      appBar: AppBar(title: Text('update student info')),
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
              controller: bookidcontroller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'book id',
              ),
            )),
        Container(
          padding: const EdgeInsets.all(20),
          child: TextField(
            controller: datecontroller,
            onChanged: validatedate,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'current date  (YYYY-MM-DD)',
              errorText: dateErrorText.isNotEmpty ? dateErrorText : null,
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            price = int.parse(pricecontroller.text);
            date = int.parse(datecontroller.text);
            bid = int.parse(bookidcontroller.text);

            Book s = Book(
              name: namecontroller.text,
              auther: authercontroller.text,
              price: int.parse(pricecontroller.text),
              bookid: int.parse(bookidcontroller.text),
              date: int.parse(datecontroller.text),
              id: widget.object.id,
            );

            print(widget.object.id);
            widget.updatefunction(s, widget.index);

            booklistupdate(namecontroller.text, authercontroller.text, price,
                bid, date, widget.object.id);

            Get.back();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
