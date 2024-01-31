// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/login_signin_screen.dart';
import 'package:suraksha_saathi/Login%20Signup%20Page/signup_email_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController(); // New controller for confirm password

  File? _photoImage;
  File? _passportImage;
  bool passToggle = true;
  bool confpassToggle = true;
  bool isChecked = false;
  String buttonText1 = 'Photo';
  String buttonText2 = 'Passport';

  Future<void> _getImage(bool isPassport) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final File file = File(image.path);
      if (isPassport) {
        _passportImage = file;
      } else {
        _photoImage = file;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.backspace_outlined,
              size: 25.0, color: Color(0xFF32508E)),
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
            key: _formKey,
            autovalidateMode:
                AutovalidateMode.always, // Set autovalidateMode to always
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 35),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: fNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.person_2_outlined, color: Color(0xFF32508E)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter First Name";
                    } else if (fNameController.text == lNameController.text) {
                      return 'First name and last name cannot be the same.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: lNameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.person_2_outlined, color: Color(0xFF32508E)),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Last Name";
                    } else if (fNameController.text == lNameController.text) {
                      return 'First name and last name cannot be the same.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
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
                SizedBox(height: 25),
                IntlPhoneField(
                  decoration: InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(borderSide: BorderSide())),
                ),
                SizedBox(height: 25),
                Text(
                  'Upload Photo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    await _getImage(false); // Set isPassport to false for photo
                    setState(() {
                      buttonText1 = 'Photo';
                      // Set the height when text is visible
                    });
                  },
                  child: _photoImage == null
                      ? Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.circular(5.0), // Border radius
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload_sharp,
                                  color: Color(0xFF32508E)),
                              SizedBox(width: 5),
                              Text(
                                buttonText1,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 137, 129, 129),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(5.0), // Border radius
                            border: Border.all(
                              color: Color(0xFF171616), // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.file(
                              _photoImage!,
                              width: 150,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 20),
                Text(
                  'Passport',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () async {
                    await _getImage(
                        true); // Set isPassport to true for passport
                    setState(() {
                      buttonText2 = 'passport';
                    });
                  },
                  child: _passportImage == null
                      ? Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius:
                                BorderRadius.circular(5.0), // Border radius
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.upload_sharp,
                                  color: Color(0xFF32508E)),
                              SizedBox(width: 5),
                              Text(
                                buttonText2,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 137, 129, 129),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(5.0), // Border radius
                            border: Border.all(
                              color: Color(0xFF171616), // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.file(
                              _passportImage!,
                              width: 150,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 25),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passwordController,
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
                    } else if (passwordController.text.length < 10) {
                      return "Password length must be at least 10 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller:
                      confirmPasswordController, // Use the new controller
                  obscureText:
                      confpassToggle, // Use confpassToggle for confirm password
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(),
                    prefixIcon:
                        Icon(Icons.lock_outlined, color: Color(0xFF32508E)),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          confpassToggle =
                              !confpassToggle; // Use confpassToggle here
                        });
                      },
                      child: Icon(
                        confpassToggle
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Color(0xFF32508E),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Confirm Password";
                    } else if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          isChecked = newValue!;
                        });
                      },
                    ),
                    Text(
                      "I agree to",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the Login screen
                      },
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Text(
                      "and",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to the Login screen
                      },
                      child: Text(
                        "Terms of Use.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    if (isChecked &&
                        (_formKey.currentState?.validate() ?? false)) {
                      // Check if both photo and passport images are uploaded
                      if (_photoImage == null || _passportImage == null) {
                        // Show an error message if either photo or passport is missing
                        print('Please upload both a photo and a passport.');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Please upload both a photo and a passport.'),
                          ),
                        );
                      } else {
                        // Proceed with signup logic
                        print('SignUp pressed');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpEmailScreen(),
                          ),
                        );
                      }
                    } else {
                      // Handle the case when the checkbox is not checked or form validation fails
                      print('Please agree to the terms and conditions');
                    }

                    // Assuming _formKey is a GlobalKey<FormState>
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      print("Success");
                      emailController.clear();
                      fNameController.clear();
                      lNameController.clear();
                      passwordController.clear();
                      confirmPasswordController.clear();
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
                        "Sign Up",
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
