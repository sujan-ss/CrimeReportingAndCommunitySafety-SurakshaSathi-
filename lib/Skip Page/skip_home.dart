// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SkipHomeScreen extends StatelessWidget {
  const SkipHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Button Grid'),
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              CustomButton(
                icon: Icons.phone,
                buttonText: 'Emergency Number',
                onPressed: () {
                  // Add your onPressed functionality here
                },
              ),
              CustomButton(
                icon: Icons.home,
                buttonText: 'Police Station',
                onPressed: () {
                  // Add your onPressed functionality here
                },
              ),
              CustomButton(
                icon: Icons.shield,
                buttonText: 'Safety Tips/Measures',
                onPressed: () {
                  // Add your onPressed functionality here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String buttonText;
  final VoidCallback onPressed;

  CustomButton({
    required this.icon,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF32508E),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF32508E),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                buttonText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
