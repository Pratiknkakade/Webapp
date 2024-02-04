import 'package:flutter/material.dart';

class WrapExample extends StatefulWidget {
  const WrapExample({super.key});

  @override
  State<WrapExample> createState() => _WrapState();
}

class _WrapState extends State<WrapExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' wrap'),
      ),
      body: Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: <Widget>[
          Container(width: 100, height: 100, color: Colors.red),
          Container(width: 100, height: 100, color: Colors.blue)
        ],
      ),
    );
  }
}
