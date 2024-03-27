// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login_signin_screen.dart';

class Test extends StatefulWidget {
  final String token;
  const Test({required this.token, Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  late String email;

  @override
  void initState() {
    super.initState();
    _verifyTokenAndLoadData();
  }

  void _verifyTokenAndLoadData() {
    if (widget.token.isNotEmpty && !JwtDecoder.isExpired(widget.token)) {
      Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
      email = jwtDecodedToken['email'];
    } else {
      // If token is null, empty, or expired, navigate to login screen
      _logout();
    }
  }

  void _logout() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform logout actions
                // For example: Clear token from SharedPreferences

                // Navigate to the login screen and remove all previous routes
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginSigninScreen()),
                  (route) => false,
                );
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(email),
            // Add other content of your test screen here
          ],
        ),
      ),
    );
  }
}
