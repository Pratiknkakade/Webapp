import 'package:flutter/material.dart';

class RichTextExample extends StatefulWidget {
  const RichTextExample({super.key});

  @override
  State<RichTextExample> createState() => _RichTextExampleState();
}

class _RichTextExampleState extends State<RichTextExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Rich text'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(40),
          child: RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text: 'Neque  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 38,
                      color: Colors.black)),
              TextSpan(
                  text: 'porro  ',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 28)),
              TextSpan(
                  text: 'quisquam ',
                  style: TextStyle(color: Colors.amber, fontSize: 28)),
              TextSpan(
                  text: 'est qui  ',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 28)),
              TextSpan(
                  text: 'dolorem ipsum quia  ',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 28)),
              TextSpan(
                  text: 'dolor sit ',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 28)),
              TextSpan(
                  text: 'amet ,  ',
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 28)),
              TextSpan(
                  text: 'consectetur  ',
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 28)),
            ]),
          ),
        ),
      ),
    );
  }
}
