import 'package:flutter/material.dart';

class SnackBarExample extends StatefulWidget {
  const SnackBarExample({super.key});

  @override
  State<SnackBarExample> createState() => _SnackBarExampleState();
}

class _SnackBarExampleState extends State<SnackBarExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' snack bar ')),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          final s = SnackBar(
            content: Text('hellow this is snack bar '),
          );
          ScaffoldMessenger.of(context).showSnackBar(s);
        },
        child: Text('show snack bar'),
      )),
    );
  }
}
