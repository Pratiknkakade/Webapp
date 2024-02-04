import 'package:flutter/material.dart';

class ListExample extends StatefulWidget {
  const ListExample({super.key});

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {
  List<int> nums = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Example")),
      body: Container(
        child: ListView.builder(
          itemCount: nums.length,
          itemBuilder: (context, index) {
            return Text(nums[index].toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          nums.add(nums.length + 1);
        });
      }),
    );
  }
}
