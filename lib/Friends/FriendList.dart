// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webapp/Friends/FriendClass.dart';

import 'AddFriend.dart';

class FriendList extends StatefulWidget {
  const FriendList({super.key});

  @override
  State<FriendList> createState() => _FriendListState();
}

class _FriendListState extends State<FriendList> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Friendclass> friend = [];

  addFriendFun(String frd, int age) {
    print("frid add called________________________________________________");
    setState(() {
      friend.add(Friendclass(name: frd, age: age));
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  fetchData() async {
    QuerySnapshot querySnapshot = await firestore.collection('friend').get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      String name = data['name'];
      int age = data['age'];
      Friendclass obj1 = Friendclass(name: name, age: age);
      friend.add(obj1);
    }
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('friend list')),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: ListView.builder(
                itemCount: friend.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onLongPress: () {
                      setState(() {
                        friend.remove(friend[index]);
                      });
                    },
                    child: ListTile(
                      title: Text(friend[index].name),
                      subtitle: Text('age: ${friend[index].age}'),
                    ),
                  );
                }),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddFriend(addFriendFun));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
