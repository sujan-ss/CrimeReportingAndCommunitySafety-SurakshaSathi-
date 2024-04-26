// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/Dashboard/notice.dart';
import 'package:suraksha_saathi/features/Dashboard/Home/Safety%20Tips/safety.dart';
import 'package:suraksha_saathi/features/Dashboard/Home/emergency_contacts.dart';
import 'package:suraksha_saathi/features/Dashboard/Home/police_station.dart';
import 'package:suraksha_saathi/features/profile/presentation/Profile.dart';
import 'package:suraksha_saathi/features/Dashboard/attachfile_location.dart';
import 'package:suraksha_saathi/features/Dashboard/notice.dart';

import 'package:suraksha_saathi/features/Authentication/presentation/Screen/login_signin_screen.dart';
import 'package:suraksha_saathi/features/Report%20Incident/report_incident_location.dart';

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
        // Navigate to Notice page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Notice()),
        );
        break;
      case 2:
        // Navigate to Notice page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
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
        automaticallyImplyLeading: false,
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
                        builder: (context) => const AttachfileLocation()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.local_hospital_rounded,
                buttonText: 'Emergency Contacts',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EmergencyContacts()),
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
                        builder: (context) => const PoliceStation()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.shield_rounded,
                buttonText: 'Safety Tips/Measures',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Safety()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.notifications_rounded,
                buttonText: 'Notice',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Notice()),
                  );
                },
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
            icon: Icon(Icons.notifications),
            label: 'Notice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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
