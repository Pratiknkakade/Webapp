import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/RealState/Counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Scaffold(
      body: Center(
        child: Text(counter.getValue().toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
      ),
    );
  }
}
