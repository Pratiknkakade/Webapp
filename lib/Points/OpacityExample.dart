import 'package:flutter/material.dart';

class OpacityExample extends StatefulWidget {
  const OpacityExample({super.key});

  @override
  State<OpacityExample> createState() => _OpacityExampleState();
}

class _OpacityExampleState extends State<OpacityExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' opacity '),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Opacity(
            opacity: 0.9,
            alwaysIncludeSemantics: true,
            child: Center(
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    'hellow',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Opacity(
            opacity: 0.7,
            alwaysIncludeSemantics: true,
            child: Center(
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    'hellow',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Opacity(
            opacity: 0.5,
            alwaysIncludeSemantics: true,
            child: Center(
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    'hellow',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Opacity(
            opacity: 0.3,
            alwaysIncludeSemantics: true,
            child: Center(
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    'hellow',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Opacity(
            opacity: 0.1,
            alwaysIncludeSemantics: true,
            child: Center(
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 100,
                child: Center(
                  child: Text(
                    'hellow',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
