import 'package:flutter/material.dart';

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<ProgressIndicatorExample> createState() =>
      _ProgressIndicatorExampleState();
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample> {
  double slidervalue = 0.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' progress indicatcor'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .6,
            child: LinearProgressIndicator(
              value: slidervalue,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Slider(
              value: slidervalue,
              onChanged: (newvalue) {
                setState(() {
                  slidervalue = newvalue;
                });
              })
        ],
      ),
    );
  }
}
