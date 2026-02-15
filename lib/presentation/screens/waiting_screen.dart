import 'package:flutter/material.dart';

import '../widgets/loading.dart';

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoadingScreen(
          title: "your Request is being processed! \n please be pation",
        ),
      ),
    );
  }
}
