// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class MedicineSwitcher extends StatefulWidget {
  final bool isAccepted;
  final ValueChanged<bool> onChanged;
  final Widget text;

  const MedicineSwitcher(
      {super.key, required this.isAccepted, required this.onChanged, required this.text});

  @override
  _MedicineSwitcherState createState() => _MedicineSwitcherState();
}

class _MedicineSwitcherState extends State<MedicineSwitcher> {
  bool isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Switch(
            value: widget.isAccepted,
            onChanged: (newValue) {
              setState(() {
                widget.onChanged(newValue);
              });
            },
            activeThumbColor:
                Colors.green, // Set the color when the medicine is accepted
            inactiveTrackColor:
                Colors.red, // Set the color when the medicine is forbidden
          ),
          widget.text
        ],
      ),
    );
  }
}
