// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget flexibleSpace;
  final Size preferredSize;
  final double? leadingWidth;

  const CustomAppBar({
    Key? key,
    this.leading,
    this.title,
    this.actions,
    required this.preferredSize,
    required this.flexibleSpace,
    this.leadingWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        leading: leading,
        leadingWidth: leadingWidth,
        title: title,
        actions: actions,
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'images/app/appBar.png',
              fit: BoxFit.cover,
            ),
            flexibleSpace,
          ],
        ),
      ),
    );
  }
}
