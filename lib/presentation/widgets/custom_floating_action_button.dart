import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const CustomFloatingActionButton(
      {Key? key, required this.onPressed, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      splashColor: Colors.transparent,
      onPressed: onPressed,
      backgroundColor: const Color(0xFF3467D2),
      elevation: 0,
      child: CircleAvatar(
        backgroundColor: const Color(0xFF3467D2),
        radius: 20.0,
        child: Icon(
          iconData,
          size: 30.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
