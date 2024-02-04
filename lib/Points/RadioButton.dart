import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String selectedGender = 'male';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' radio button '),
      ),
      body: Column(
        children: [
          RadioListTile(
            title: Text('male'),
            value: 'male',
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
            activeColor: Colors.blue,
          ),
          RadioListTile(
            title: Text('female'),
            value: 'female',
            groupValue: selectedGender,
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
            activeColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
