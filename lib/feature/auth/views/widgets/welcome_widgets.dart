import 'package:flutter/material.dart';

class WelcomeWidgets extends StatelessWidget {
  const WelcomeWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Welcome To Our Market",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
