import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SelectableTextExample extends StatefulWidget {
  const SelectableTextExample({super.key});

  @override
  State<SelectableTextExample> createState() => _SelectableTextExampleState();
}

class _SelectableTextExampleState extends State<SelectableTextExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' selectable text ')),
      body: SelectableText(
        'Hello Flutter !',
        style: TextStyle(fontSize: 20.0, color: Colors.blue),
        showCursor: true,
        cursorColor: Colors.red,
        enableInteractiveSelection: true,
        toolbarOptions: ToolbarOptions(copy: true, cut: true, paste: true),
      ),
    );
  }
}
