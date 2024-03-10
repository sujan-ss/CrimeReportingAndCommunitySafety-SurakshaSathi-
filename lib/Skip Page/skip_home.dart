// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:suraksha_saathi/Login%20Signup%20Page/login_signin_screen.dart';
import 'package:suraksha_saathi/Skip%20Page/Skip%20Safety%20Tips/skip_safety.dart';
import 'package:suraksha_saathi/Skip%20Page/skip_emergency_contacts.dart';
import 'package:suraksha_saathi/Skip%20Page/skip_police_station.dart';

class SkipHomeScreen extends StatelessWidget {
  const SkipHomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,
              size: 29.0, color: Color(0xFF32508E)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginSigninScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1, // Adjust aspect ratio as needed
            mainAxisSpacing: 20.0, // Vertical spacing between buttons
            crossAxisSpacing: 20.0, // Horizontal spacing between buttons

            children: [
              CustomButton(
                icon: Icons.local_hospital_rounded,
                buttonText: 'Emergency Contacts',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SkipEmergencyContacts()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.home_rounded,
                buttonText: 'Police Station',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SkipPoliceStation()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.shield_rounded,
                buttonText: 'Safety Tips/Measures',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SkipSafety()),
                  );
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
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
