// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/login_signin_screen.dart';

class SignUpEmailScreen extends StatelessWidget {
  const SignUpEmailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Wrap your Column with SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150.0),
              Image.asset(
                'assets/Sign up email Screen.png',
                width: 250.0,
                height: 250.0,
              ),
              SizedBox(height: 30.0), // Adjusted spacing
              Text(
                'Verification Process',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0), // Adjusted spacing
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

              SizedBox(height: 40.0),

              ElevatedButton(
                onPressed: () {
                  print('Go Back pressedd');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginSigninScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  backgroundColor: Color(0xFF32508E),
                  foregroundColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                ),
                child: Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
