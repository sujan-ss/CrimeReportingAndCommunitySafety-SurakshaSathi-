// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Dashboard/Profile.dart';

import 'package:suraksha_saathi/Login%20Signup%20Page/login_signin_screen.dart';
import 'package:suraksha_saathi/attachfile.dart';
import 'package:suraksha_saathi/report_incident_location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages based on the selected index
    switch (index) {
      case 0:
        // Navigate to Home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        break;
      case 1:
        // Navigate to Profile page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileTab()),
        );
        break;
      case 2:
        // Navigate to Settings page
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => SettingsScreen()),
        // );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined,
              size: 29.0, color: Color(0xFF32508E)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginSigninScreen()),
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
                icon: Icons.report_gmailerrorred_rounded,
                buttonText: 'Report Incident',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportIncidentLocation()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.attach_file_rounded,
                buttonText: 'Attach Files',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AttachFiles()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.local_hospital_rounded,
                buttonText: 'Emergency Contacts',
                onPressed: () {},
              ),
              CustomButton(
                icon: Icons.home_rounded,
                buttonText: 'Police Station',
                onPressed: () {},
              ),
              CustomButton(
                icon: Icons.shield_rounded,
                buttonText: 'Safety Tips/Measures',
                onPressed: () {},
              ),
              CustomButton(
                icon: Icons.notifications_rounded,
                buttonText: 'Notice',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF32508E),
        onTap: _onItemTapped,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String buttonText;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF32508E),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF32508E),
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
              const SizedBox(height: 10),
              Text(
                buttonText,
                style: const TextStyle(
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
