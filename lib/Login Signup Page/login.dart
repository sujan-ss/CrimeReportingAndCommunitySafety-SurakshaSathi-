// ignore_for_file: prefer_const_constructors, avoid_print, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login_signin_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formField,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Login to Suraksha Saathi',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.email_outlined, color: Color(0xFF32508E)),
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~]+@gmail\.com$")
                        .hasMatch(value!);

                    if (value.isEmpty) {
                      return "Enter Email";
                    } else if (!emailValid) {
                      return "Enter Valid Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.lock_outlined, color: Color(0xFF32508E)),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                        passToggle
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFF32508E),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Password";
                    } else if (passController.text.length < 10) {
                      return "Password length must be at least 10 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                Center(
                  child: TextButton(
                    onPressed: () {
                      // Handle Forgot Password button press
                      print('Forgot Password button pressed');
                      // Add your logic for "Forgot Password" functionality
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    if (formField.currentState!.validate()) {
                      print("Success");
                      emailController.clear();
                      passController.clear();
                    }
                  },
                  child: Container(
                    height: 55,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF32508E),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
