import 'package:flutter/material.dart';

class DividerExample extends StatelessWidget {
  const DividerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Divider')),
      body: const Center(
        child: Column(
          children: [
            Expanded(
              child: ColoredBox(
                color: Colors.amber,
                child: Center(
                  child: Text('Above'),
                ),
              ),
            ),
            Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
              color: Colors.black,
            ),
            Expanded(
              child: ColoredBox(
                color: Colors.blue,
                child: Center(
                  child: Text('Below'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
