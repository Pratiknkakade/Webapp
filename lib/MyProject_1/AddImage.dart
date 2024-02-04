import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  const AddImage({super.key});

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' image'),
      ),
      body: Row(children: [
        Container(
          padding: const EdgeInsets.all(55),
          child: Image.asset(
            'assets/images/img1.jpg',
            height: 50,
            width: 50,
            fit: BoxFit.fill,
          ),
        ),
      ]),
    );
  }
}
