import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webapp/MyProject_1/herolist/cartoon.dart';

class CartoonDescription extends StatelessWidget {
  final Cartoon cartoon;

  CartoonDescription({required this.cartoon});

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: Text('Cartoon Description'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(cartoon.imageUrl),
            SizedBox(height: 16),
            Text('Name: ${cartoon.name}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Age: ${cartoon.age}'),
            Text('Power: ${cartoon.power}'),
          ],
        ),
      ),
    );
  }
}
