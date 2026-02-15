import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma/presentation/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  Map<int, Color> color = {
    50: const Color.fromARGB(255, 52, 103, 210),
    100: const Color.fromARGB(255, 52, 103, 210),
    200: const Color.fromARGB(255, 52, 103, 210),
    300: const Color.fromARGB(255, 52, 103, 210),
    400: const Color.fromARGB(255, 52, 103, 210),
    500: const Color.fromARGB(255, 52, 103, 210),
    600: const Color.fromARGB(255, 52, 103, 210),
    700: const Color.fromARGB(255, 52, 103, 210),
    800: const Color.fromARGB(255, 52, 103, 210),
    900: const Color.fromARGB(255, 52, 103, 210),
  };

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    MaterialColor colorCustom = MaterialColor(0xFF3467D2, color);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: colorCustom,
      ),
      home: const SplashScreen(),
    );
  }
}
