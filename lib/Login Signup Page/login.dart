// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login_signin_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginSigninScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login to Suraksha Saathi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Email/Phone',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              // Add your logic for handling email/phone input
              decoration: InputDecoration(
                hintText: 'Enter your email or phone number',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextFormField(
              // Add your logic for handling password input
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Add your logic for "Forgot Password" functionality
              },
              child: Text('Forgot Password?'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle create new account button press
                print('Login pressed');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the border radius as needed
                ),
                backgroundColor: Color(0xFF32508E), // Button background color
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 90.0,
                    vertical: 15.0), // Adjust padding as needed
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
