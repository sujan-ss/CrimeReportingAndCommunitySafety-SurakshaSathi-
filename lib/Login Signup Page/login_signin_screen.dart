// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/signup.dart';
import 'package:suraksha_saathi/home.dart';

class LoginSigninScreen extends StatelessWidget {
  const LoginSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              fontSize: 24.0, // Adjust the font size as needed
              fontWeight: FontWeight.normal,
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
                borderRadius: BorderRadius.circular(10.0),
              ),
              backgroundColor: Color(0xFF32508E),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            ),
            child: Text('Create New Account'),
          ),
          SizedBox(height: 15.0),

          // Already have an account button
          TextButton(
            onPressed: () {
              // Handle already have an account button press
              print('Already Have an Account pressed');

              // Navigate to the Login page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 16.0,
              ),
            ),
            child: Text('I Already Have an Account'),
          ),
          SizedBox(height: 40.0),

          // Skip Button
          TextButton(
            onPressed: () {
              // Handle Skip button press
              print('Skip button pressed');

              // Navigate to the Skip Landing Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 40.0), // Adjusted padding
              textStyle: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 18.0,
              ),
            ),
            child: Text('Skip'),
          )
        ]),
      ),
    );
  }
}
