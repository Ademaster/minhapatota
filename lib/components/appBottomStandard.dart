import 'package:flutter/material.dart';

class AppBottomStandard extends StatelessWidget {
  const AppBottomStandard({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 0, 255, 147),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          "by Ademaster © 2025 V1.0.0",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
