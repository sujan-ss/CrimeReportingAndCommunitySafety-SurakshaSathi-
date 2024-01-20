// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Square Buttons Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareButton(
              label: 'Button 1',
              icon: Icons.star,
              onPressed: () => print('Button 1 pressed'),
            ),
            SizedBox(height: 20),
            SquareButton(
              label: 'Button 2',
              icon: Icons.favorite,
              onPressed: () => print('Button 2 pressed'),
            ),
            SizedBox(height: 20),
            SquareButton(
              label: 'Button 3',
              icon: Icons.thumb_up,
              onPressed: () => print('Button 3 pressed'),
            ),
            SizedBox(height: 20),
            SquareButton(
              label: 'Button 4',
              icon: Icons.thumb_down,
              onPressed: () => print('Button 4 pressed'),
            ),
            SizedBox(height: 20),
            SquareButton(
              label: 'Button 5',
              icon: Icons.add,
              onPressed: () => print('Button 5 pressed'),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const SquareButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 30),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
