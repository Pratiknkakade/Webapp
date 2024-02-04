import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListExample3 extends StatefulWidget {
  const ListExample3({super.key});

  @override
  State<ListExample3> createState() => _ListExample3State();
}

final TextEditingController namecontroller = TextEditingController();

class _ListExample3State extends State<ListExample3> {
  List<String> friends = [];

  @override
  void dispose() {
    namecontroller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Example 2")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onLongPress: () {
                      setState(() {
                        friends.remove(friends[index]);
                      });
                    },
                    onTap: () {
                      print(friends[index]);
                    },
                    child: ListTile(title: Text(friends[index].toString())));
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
          namecontroller.text = '';
          // print(namecontroller.text);
        });
      }),
    );
  }
}
