// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/signup.dart';

class LoginSigninScreen extends StatelessWidget {
  const LoginSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // Your logo image
          Image.asset(
            'assets/SignIn_LogInLogo.png', // Replace with the path to your logo image
            width: 200.0,
            height: 200.0,
            // Adjust width and height based on your logo size
          ),
          SizedBox(height: 40.0),
          // Welcome text with increased font size
          Text(
            'Welcome to Suraksha Sathi',
            style: TextStyle(
              fontSize: 24.0, // Adjust the font size as needed
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 30.0),
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
                borderRadius: BorderRadius.circular(
                    10.0), // Adjust the border radius as needed
              ),
              backgroundColor: Color(0xFF32508E), // Button background color
              foregroundColor: Colors.white, // Text color
              padding: EdgeInsets.symmetric(
                  horizontal: 30.0, vertical: 15.0), // Adjust padding as needed
            ),
            child: Text('Create New Account'),
          ),
          SizedBox(height: 20.0),
          // Already have an account button
          TextButton(
            onPressed: () {
              // Handle already have an account button press
              print('Already Have an Account pressed');

              // Navigate to the Login page (replace 'Login' with your actual page name)
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('I Already Have an Account'),
          )
        ]),
      ),
    );
  }
}
