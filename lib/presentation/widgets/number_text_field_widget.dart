// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

class NumberTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final List<int> numbers;
  final String? Function(int?)? validator;
  final bool isEnabled;

  const NumberTextField({super.key, 
    required this.labelText,
    required this.controller,
    required this.numbers,
    this.validator,
    this.isEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 8.0,
          ),
          hintText: '$labelText',
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        initialValue: int.tryParse(controller.text),
        items: numbers.map((number) {
          return DropdownMenuItem<int>(
            value: number,
            child: Text(number.toString()),
          );
        }).toList(),
        onChanged: isEnabled
            ? (value) {
                controller.text = value.toString();
              }
            : null,
        validator: validator,
      ),
    );
  }
}
