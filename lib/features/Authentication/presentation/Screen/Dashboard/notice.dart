// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/Dashboard/Home/home.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key); // Fix constructor syntax

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap the Center widget with a Scaffold
      appBar: AppBar(
        title: const Text('Notice'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined,
              size: 29.0, color: Color(0xFF32508E)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),
      body: const Center(), // Add body content here if needed
    );
  }
}
