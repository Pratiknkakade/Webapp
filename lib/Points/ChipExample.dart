import 'package:flutter/material.dart';

class ChipExample extends StatefulWidget {
  const ChipExample({super.key});

  @override
  State<ChipExample> createState() => _ChipState();
}

class _ChipState extends State<ChipExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' chip ')),
      body: Chip(
        label: Text('Tag'),
        avatar: Icon(Icons.label),
        backgroundColor: Colors.blue,
        labelStyle: TextStyle(color: Colors.white),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onDeleted: () {},
        deleteIcon: Icon(Icons.cancel),
        deleteIconColor: Colors.red,
        padding: EdgeInsets.all(8.0),
        shadowColor: Colors.grey,
        elevation: 2,
      ),
    );
  }
}
