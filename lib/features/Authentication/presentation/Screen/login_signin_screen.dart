// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/features/Dashboard/Home/home.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/login_screen.dart/login.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/signup/presentation.dart/signup.dart';
import 'package:suraksha_saathi/features/Skip%20Page/skip_home.dart';
import 'package:suraksha_saathi/demodash.dart';

class LoginSigninScreen extends StatelessWidget {
  const LoginSigninScreen({Key? key})
      : super(key: key); // Initialize the constructor correctly

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your logo image
            const SizedBox(height: 100.0),
            Image.asset(
              'assets/SignIn_LogInLogo.png', // Replace with the path to your logo image
              width: 200.0,
              height: 200.0,
              // Adjust width and height based on your logo size
            ),
            const SizedBox(height: 100.0),
            // Welcome text with increased font size
            const Text(
              'Welcome to Suraksha Sathi',
              style: TextStyle(
                fontSize: 26.0, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40.0), // Adjusted spacing

            // Create new account button with custom styling
            ElevatedButton(
              onPressed: () {
                // Handle create new account button press
                print('Create New Account pressed');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: const Color(0xFF32508E),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                    horizontal: 80.0, vertical: 15.0),
              ),
              child: const Text('Create New Account'),
            ),
            const SizedBox(height: 15.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
                      MaterialPageRoute(
                          builder: (context) => const loginPage()),
                    );
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40.0),

            // Skip Button
            TextButton(
              onPressed: () {
                // Handle Skip button press
                print('Skip button pressed');
                // Navigate to the Login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SkipHomeScreen()),
                );
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 40.0),

            // Skip Button
            TextButton(
              onPressed: () {
                // Navigate to the Login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text(
                "Main home",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 40.0),

            // Skip Button
            TextButton(
              onPressed: () {
                // Navigate to the Login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              child: const Text(
                "Dashboard",
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
