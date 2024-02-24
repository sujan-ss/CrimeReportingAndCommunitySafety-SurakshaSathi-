// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login_signin_screen.dart';

class test extends StatefulWidget {
  final String token; // Ensure token is explicitly typed as String
  const test({required this.token, Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<test> {
  late String email;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);
    email = jwtDecodedToken['email'];
  }

  // Function to handle logout action
  void _logout() async {
    // Perform logout actions, such as clearing token from SharedPreferences
    // For example:
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove('token');

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginSigninScreen()),
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
