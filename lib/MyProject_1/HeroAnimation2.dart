import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webapp/MyProject_1/PhotoHero.dart';

class HeroAnimation2 extends StatelessWidget {
  const HeroAnimation2({super.key});

  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flippers Page'),
      ),
      body: ListView(children: [
        Container(
          // Set background to blue to emphasize that it's a new route.
          color: Colors.lightBlueAccent,
          padding: const EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: PhotoHero(
            photo:
                'https://www.animaker.com/hub/wp-content/uploads/2023/03/Mickey_Mouse_Disney_1.webp',
            width: 300.0,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ]),
    );
  }
}
