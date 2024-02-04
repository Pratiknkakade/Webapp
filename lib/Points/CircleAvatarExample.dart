import 'package:flutter/material.dart';

class CircleAvtarExample extends StatefulWidget {
  const CircleAvtarExample({super.key});

  @override
  State<CircleAvtarExample> createState() => _CircleAvtarExampleState();
}

class _CircleAvtarExampleState extends State<CircleAvtarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' circle avatar'),
      ),
      body: CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('assets/images/img1.jpg'),
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.person,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}
