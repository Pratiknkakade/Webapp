import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webapp/MyProject_1/HeroAnimation2.dart';
import 'package:webapp/MyProject_1/PhotoHero.dart';

class HeroAnimation1 extends StatelessWidget {
  const HeroAnimation1({super.key});

  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: ListView(children: [
        PhotoHero(
          photo:
              'https://www.animaker.com/hub/wp-content/uploads/2023/03/Mickey_Mouse_Disney_1.webp',
          width: 100.0,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HeroAnimation2()),
            );
          },
        ),
      ]),
    );
  }
}
