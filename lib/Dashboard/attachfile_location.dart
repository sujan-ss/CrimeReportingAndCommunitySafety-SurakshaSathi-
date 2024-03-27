// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Dashboard/Home/home.dart';
import 'package:suraksha_saathi/Dashboard/attachfile.dart';

class AttachfileLocation extends StatelessWidget {
  const AttachfileLocation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined,
              size: 29.0, color: Color(0xFF32508E)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
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
                icon: Icons.location_city_rounded,
                buttonText: 'Tripureshowr',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AttachFiles()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.home_rounded,
                buttonText: 'Dillibazar',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => AttachFiles()),
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
