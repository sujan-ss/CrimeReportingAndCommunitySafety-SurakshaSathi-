import 'package:flutter/material.dart';

class UnverifedScreen {
  static showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const Unverified(),
    );
  }
}

class Unverified extends StatelessWidget {
  const Unverified({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: const Column(
        children: [
          Spacer(),
          Icon(Icons.error, color: Colors.red, size: 200),
          SizedBox(height: 40),
          Text(
            'Your account is not verified yet. Please wait to verify your account first.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
