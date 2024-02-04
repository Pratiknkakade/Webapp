import 'package:flutter/material.dart';

class TransFormExample extends StatefulWidget {
  const TransFormExample({super.key});

  @override
  State<TransFormExample> createState() => _TransFormExampleState();
}

class _TransFormExampleState extends State<TransFormExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' transform ')),
      body: Transform(
        transform: Matrix4.rotationZ(0.5),
        child: Image.asset('assets/images/img1.jpg'),
      ),
    );
  }
}
