import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/BookModule/Book.dart';
import 'package:webapp/BookModule/BookAdd.dart';
import 'package:webapp/BookModule/BookUpdate.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Book> booklist = [];

  void booklistfunction(String bName, String bAuther, int bPrice, int bId,
      int bDate, String docId) {
    setState(() {
      booklist.add(Book(
          name: bName,
          auther: bAuther,
          price: bPrice,
          bookid: bId,
          date: bDate,
          id: docId));
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    QuerySnapshot querySnapshot =
        await firestore.collection('BookCollection').get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String name = data['name'];
      String auther = data['auther'];
      int price = data['price'];
      int bookid = data['bookid'];
      int date = data['date'];

      String id = doc.id.toString();

      Book obj1 = Book(
          name: name,
          auther: auther,
          price: price,
          bookid: bookid,
          date: date,
          id: id);

      booklist.add(obj1);
    }
    setState(() {});
  }

  void changebook(Book bookobj, int index) {
    setState(() {
      booklist[index] = bookobj;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Book list')),
        body: Container(
          child: ListView.builder(
              itemCount: booklist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    setState(() {
                      deleteFromDataBase(booklist[index].id);
                      booklist.remove(booklist[index]);
                    });
                  },
                  onTap: () {
                    setState(() {
                      Get.to(BookUpdate(booklist[index], index, changebook));
                    });
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Text(
                      booklist[index].bookid.toString(),
                      style: TextStyle(fontSize: 10),
                    )),
                    title: Text(booklist[index].name),
                    subtitle: Text('Auther : ${booklist[index].auther}'),
                    trailing: Text(booklist[index].price.toString()),
                  ),
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(BookAdd(booklistfunction));
          },
          child: const Icon(Icons.add),
        ));
  }

  void deleteFromDataBase(String id) async {
    FirebaseFirestore.instance.collection("BookCollection").doc(id).delete();
  }
}
