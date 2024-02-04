import 'package:flutter/material.dart';
import 'package:webapp/MyProject_1/HeroPractice/HeroDeatils.dart';

class HeroPage1 extends StatefulWidget {
  const HeroPage1({super.key});

  @override
  State<HeroPage1> createState() => _HeroPage1State();
}

class _HeroPage1State extends State<HeroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' hero page 1 '),
      ),
      body: Container(
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeroDeatils(),
                  ));
            },
            child: Hero(
              tag: 'baground',
              child: Image.network(
                'https://w.forfun.com/fetch/50/5081f28733ce69397d496a2dfdcedc2d.jpeg',
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
