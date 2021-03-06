import 'package:flutter/material.dart';

class MainTextField extends StatelessWidget {
  TextEditingController controller;
  String hint;

  MainTextField({this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(hint),
        border: OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }
}
