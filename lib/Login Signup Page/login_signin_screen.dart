// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/signup.dart';
import 'package:suraksha_saathi/emergency_contacts.dart';

class LoginSigninScreen extends StatelessWidget {
  const LoginSigninScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo image
            SizedBox(height: 100.0),
            Image.asset(
              'assets/SignIn_LogInLogo.png', // Replace with the path to your logo image
              width: 200.0,
              height: 200.0,
              // Adjust width and height based on your logo size
            ),
            SizedBox(height: 100.0),
            // Welcome text with increased font size
            Text(
              'Welcome to Suraksha Sathi',
              style: TextStyle(
                fontSize: 26.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0), // Adjusted spacing

            // Create new account button with custom styling
            ElevatedButton(
              onPressed: () {
                // Handle create new account button press
                print('Create New Account pressed');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Color(0xFF32508E),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              ),
              child: Text('Create New Account'),
            ),
            SizedBox(height: 15.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the Login screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40.0),

            // Skip Button
            TextButton(
              onPressed: () {
                // Handle Skip button press
                print('Skip button pressed');
                // Navigate to the Login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EmergencyContacts()),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
