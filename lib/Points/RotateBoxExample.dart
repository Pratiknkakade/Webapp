import 'package:flutter/material.dart';

class RotateBoxExample extends StatefulWidget {
  const RotateBoxExample({super.key});

  @override
  State<RotateBoxExample> createState() => _RotateBoxExampleState();
}

class _RotateBoxExampleState extends State<RotateBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' rotate box ')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              height: 200,
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              color: Colors.blue,
              child: const RotatedBox(
                quarterTurns: 3,
                child: Center(
                  child: Text(
                    ' Box Rotate',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  ' Loremever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s wi',
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ),
              ))
        ],
      ),
    );
  }
}
