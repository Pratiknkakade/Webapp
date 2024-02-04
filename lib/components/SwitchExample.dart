import 'package:flutter/material.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;
  bool slight = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            children: [
              Switch(
                // This bool value toggles the switch.
                value: light,
                onChanged: (bool valu) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    light = valu;
                  });
                },
              ),
              Switch(
                // This bool value toggles the switch.
                value: slight,
                activeColor: Colors.black,
                inactiveTrackColor: Colors.red,
                inactiveThumbColor: Colors.amber,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    slight = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
