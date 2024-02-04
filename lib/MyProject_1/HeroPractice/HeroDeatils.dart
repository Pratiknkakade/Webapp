import 'package:flutter/material.dart';

class HeroDeatils extends StatelessWidget {
  const HeroDeatils({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' hero page deatils '),
      ),
      body: Container(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: 'baground',
            child: Image.network(
              'https://w.forfun.com/fetch/50/5081f28733ce69397d496a2dfdcedc2d.jpeg',
            ),
          ),
        ),
      ),
    );
  }
}
