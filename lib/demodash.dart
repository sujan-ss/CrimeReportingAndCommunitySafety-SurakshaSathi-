// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/login_signin_screen.dart';
import 'package:suraksha_saathi/features/Report%20Incident/report_incident_location.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigate to different pages based on the selected index
    switch (index) {
      case 0:
        // Navigate to Home page
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
        // );
        break;
      case 1:
        // Navigate to Notice page
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const Notice()),
        // );
        break;
      case 2:
        // Navigate to Notice page
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const Profile()),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Add your navigation logic here
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const LoginSigninScreen()),
            );
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF32508E), // Set the color directly here
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Home',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize:
                              35, // Adjust the font size as per your requirement
                        ),
                  ),
                  subtitle: Text(
                    'Welcome to Suraksha Saathi',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize:
                              18.5, // Adjust the font size as per your requirement
                        ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: const Color(0xFF32508E),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(250))),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to the report Incident page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ReportIncidentLocation()),
                      );
                    },
                    child: itemDashboard(
                      'Report Incident',
                      Icons
                          .report_gmailerrorred_rounded, // Change the icon here
                      Colors.deepOrange,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the  page
                    },
                    child: itemDashboard(
                      'Analytics',
                      CupertinoIcons.graph_circle,
                      Colors.green,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Audience page
                    },
                    child: itemDashboard(
                      'Audience',
                      CupertinoIcons.person_2,
                      Colors.purple,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Comments page
                    },
                    child: itemDashboard(
                      'Comments',
                      CupertinoIcons.chat_bubble_2,
                      Colors.brown,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Revenue page
                    },
                    child: itemDashboard(
                      'Revenue',
                      CupertinoIcons.money_dollar_circle,
                      Colors.indigo,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the Upload page
                    },
                    child: itemDashboard(
                      'Upload',
                      CupertinoIcons.add_circled,
                      Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
      backgroundColor: Colors.white,
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background) =>
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Theme.of(context).primaryColor.withOpacity(.2),
                  spreadRadius: 2,
                  blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(iconData, color: Colors.white)),
            const SizedBox(height: 15),
            Text(title.toUpperCase(),
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
      );
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
