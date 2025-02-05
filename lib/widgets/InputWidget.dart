import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController controller;

  const InputWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: TextField(
            controller: controller,
            decoration: InputDecoration(
                label: Text("nome"), border: OutlineInputBorder())));
  }
}
