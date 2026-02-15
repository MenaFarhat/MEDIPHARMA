import 'package:flutter/material.dart';

class NumberYearTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final List<int> numbers;
  final String? Function(int?)? validator;
  final bool isEnabled;

  const NumberYearTextField({super.key, 
    required this.labelText,
    required this.controller,
    required this.numbers,
    this.validator,
    this.isEnabled = true,
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
          hintText: labelText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
        ),
        initialValue: int.tryParse(controller.text),
        items: numbers.map((number) {
          int year = DateTime.now().year - number;
          return DropdownMenuItem<int>(
            value: year,
            child: Text(year.toString()),
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
