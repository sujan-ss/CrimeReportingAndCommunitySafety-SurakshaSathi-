// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login_signin_screen.dart';

class SignUpEmailScreen extends StatelessWidget {
  const SignUpEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo image
            SizedBox(height: 30.0),
            Image.asset(
              'assets/Sign up email Screen.png', // Replace with the path to your logo image
              width: 250.0,
              height: 250.0,
              // Adjust width and height based on your logo size
            ),
            SizedBox(height: 90.0),
            // Welcome text with increased font size
            Text(
              'Verification Process',
              style: TextStyle(
                fontSize: 24.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25.0), // Adjusted spacing
            // Additional text with justification and padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'Thank you for creating an account with us. Your account is currently under verification. This process may take up to 24 hours.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 10.0), // Adjusted spacing
            // Additional text with justification and padding
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                'An email will be sent to you once the verification is complete. We appreciate your patience!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Handle create new account button press
                print('Go Back pressed');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSigninScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the border radius as needed
                  side: BorderSide(color: Colors.black), // Black stroke
                ),
                backgroundColor: const Color.fromARGB(
                    255, 255, 255, 255), // White background
                foregroundColor: Colors.black, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 20.0), // Adjust padding as needed
              ),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
