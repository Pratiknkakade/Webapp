import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddFriend extends StatefulWidget {
  Function addFriendFun;
  AddFriend(this.addFriendFun, {super.key});

  @override
  State<AddFriend> createState() => _AddFriendState();
}

final TextEditingController namecontrolle = TextEditingController();
final TextEditingController agecontrolle = TextEditingController();

Future<void> addfriend(String name, int age) async {
  CollectionReference friend = FirebaseFirestore.instance.collection('friend');

  await friend.add({
    'name': name,
    'age': age,
  });
}

@override
void dispose() {
  namecontrolle.dispose();
  agecontrolle.dispose();
}

class _AddFriendState extends State<AddFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Friend'),
      ),
      body: Column(children: [
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
              controller: agecontrolle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'age',
              ),
            )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addfriend(namecontrolle.text, int.parse(agecontrolle.text));
          widget.addFriendFun(namecontrolle.text, int.parse(agecontrolle.text));

          Get.back();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
