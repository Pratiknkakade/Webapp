import 'dart:ffi';

import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  final TextEditingController slidecontroller1 = TextEditingController();
  final TextEditingController slidecontroller2 = TextEditingController();
  double _currentSliderPrimaryValue = 0.1;
  double _currentSliderSecondaryValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            slidecontroller1.text
                .substring(0, slidecontroller1.text.indexOf(".")),
            style: TextStyle(fontSize: 60),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            slidecontroller2.text,
            style: TextStyle(fontSize: 60),
          ),
          Container(
            child: Slider(
              value: _currentSliderPrimaryValue,
              //secondaryTrackValue: _currentSliderSecondaryValue,
              label: _currentSliderPrimaryValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderPrimaryValue = value;
                  slidecontroller1.text = (value * 100).toString();
                });
              },
            ),
          ),
          Container(
            child: Slider(
              value: _currentSliderSecondaryValue,
              label: _currentSliderSecondaryValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderSecondaryValue = value;
                  slidecontroller2.text = (value * 100).toString();
                });
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            child: TextField(
              controller: slidecontroller1,
              //onChanged: validatedate,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: ' value of slide ',
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            child: TextField(
              controller: slidecontroller2,
              //onChanged: validatedate,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: ' value of slide ',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
