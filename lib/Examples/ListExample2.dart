import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListExample2 extends StatefulWidget {
  const ListExample2({super.key});

  @override
  State<ListExample2> createState() => _ListExample2State();
}

final TextEditingController namecontroller = TextEditingController();

class _ListExample2State extends State<ListExample2> {
  List<String> friends = [];

  @override
  void dispose() {
    namecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Example 2")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return Text(friends[index].toString());
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'name',
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          //nums.add(namecontroller);
          friends.add(namecontroller.text);
          // print(namecontroller.text);
        });
      }),
    );
  }
}
