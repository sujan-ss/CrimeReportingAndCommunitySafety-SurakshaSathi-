// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/login_signin_screen.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/signup/bloc/signup_bloc.dart';
import 'package:suraksha_saathi/data/reposotory/files_repo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController fNameController;
  late final TextEditingController lNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneController;
  late final TextEditingController _imageController;

  bool passToggle = true;
  bool confpassToggle = true;
  bool isChecked = false;
  bool _autoValidate = false;
  bool ischeck = false;
  String imageFilePath = '';
  String profilePath = '';
  String imageUrl = '';
  String profileUrl = '';
  bool isProfileLoading = false;
  bool isImageLoading = false;

  @override
  void initState() {
    emailController = TextEditingController();
    fNameController = TextEditingController();
    lNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    _imageController = TextEditingController();
    phoneController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    _imageController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: Scaffold(
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
            child: BlocListener<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignUpLoading) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          child: Center(child: CircularProgressIndicator()));
                    },
                  );
                } else {
                  Navigator.of(context).pop();
                  if (state is SignUpFailure) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Login Failed"),
                          content: Text(state.message),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }
              },
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    autovalidateMode: _autoValidate
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                isProfileLoading = true;
                              });
                              final pickedFile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);

                              if (pickedFile != null) {
                                profileUrl = await FileRepo.uploadImage(
                                    pickedFile.path, FileTypo.image);
                                setState(() {
                                  profilePath = pickedFile.path;
                                });
                              }
                              setState(() {
                                isProfileLoading = false;
                              });
                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.blue,
                              child: isProfileLoading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : profilePath.isEmpty
                                      ? Icon(
                                          Icons.camera,
                                          size: 50,
                                          color: Color(0xFF32508E),
                                        )
                                      : CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.blue,
                                          backgroundImage:
                                              FileImage(File(profilePath)),
                                        ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25), // Add some space
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF32508E),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "First Name",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_2_outlined,
                                color: Color(0xFF32508E)),
                          ),
                          textCapitalization: TextCapitalization.words,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter First Name";
                            } else if (fNameController.text ==
                                lNameController.text) {
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF32508E),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Last Name",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person_2_outlined,
                                color: Color(0xFF32508E)),
                          ),
                          textCapitalization: TextCapitalization.words,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Last Name";
                            } else if (fNameController.text ==
                                lNameController.text) {
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF32508E),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Email",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email_outlined,
                                color: Color(0xFF32508E)),
                          ),
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@(?:gmail|hotmail|yahoo|outlook)\.(?:com)$")
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
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF32508E),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Phone Number",
                            border:
                                OutlineInputBorder(borderSide: BorderSide()),
                          ),
                          initialCountryCode: "NP",
                          onChanged: (phone) {
                            // Use the built-in validation provided by IntlPhoneField
                          },
                          onCountryChanged: (country) {
                            // Handle country change if needed
                          },
                          validator: (phone) {
                            if (phone == null || phone.number.isEmpty) {
                              return 'Please enter a valid phone number';
                            } else if (phoneController.text
                                .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                              return 'Phone number should not contain special symbols';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 25),
                        buildAttachmentButton(
                          isLoading: isImageLoading,
                          title: imageFilePath.isEmpty
                              ? 'Attach Image'
                              : 'Image Uploaded',
                          icon: Icons.image,
                          filePath: imageFilePath,
                          controller: _imageController,
                          onPressed: () async {
                            setState(() {
                              isImageLoading = true;
                            });
                            final pickedFile = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (pickedFile != null) {
                              imageUrl = await FileRepo.uploadImage(
                                  pickedFile.path, FileTypo.image);
                              setState(() {
                                profilePath = pickedFile.path;
                              });
                              setState(() {
                                imageFilePath = pickedFile.path;
                                _imageController.text = pickedFile.path;
                              });
                            }
                            setState(() {
                              isImageLoading = false;
                            });
                          },
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordController,
                          obscureText: confpassToggle,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF32508E),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock_outlined,
                                color: Color(0xFF32508E)),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  confpassToggle = !confpassToggle;
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
                          style: TextStyle(
                              color: Colors.black), // Apply style here
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        FlutterPwValidator(
                          defaultColor: Colors.grey.shade600,
                          controller: passwordController,
                          successColor: Colors.green.shade700,
                          minLength: 8,
                          uppercaseCharCount: 1,
                          numericCharCount: 3,
                          specialCharCount: 1,
                          normalCharCount: 3,
                          width: 300,
                          height: 150,
                          onSuccess: () {
                            setState(() {
                              isChecked = true;
                            });
                          },
                          onFail: () {
                            setState(() {
                              isChecked = false;
                            });
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF32508E),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock_outlined,
                                color: Color(0xFF32508E)),
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
                              value: ischeck,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  ischeck = newValue!;
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
                            print(profileUrl);
                            print(imageUrl);
                            // Check form validation
                            if ((_formKey.currentState?.validate() ?? false)) {
                              // Check if the checkbox is checked
                              if (ischeck) {
                                // Proceed with signup logic
                                BlocProvider.of<SignupBloc>(context).add(
                                  FormSubmitEvent(
                                    number: phoneController.text,
                                    firstName: fNameController.text,
                                    lastName: lNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    imageUrl: profileUrl,
                                    passportImageUrl: imageUrl,
                                  ),
                                );
                              } else {
                                // Show error message for terms acceptance
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Please agree to the terms and conditions.',
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }
                            } else {
                              // Show validation errors
                              setState(() {
                                _autoValidate = true;
                              });
                            }
                          },
                          child: Container(
                            height: 55,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF32508E),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildAttachmentButton(
    {required String title,
    required IconData icon,
    required String filePath,
    required TextEditingController controller,
    required VoidCallback onPressed,
    required bool isLoading}) {
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
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (filePath
                      .isNotEmpty) // Display audio file name if filePath is not empty
                    Text(
                      filePath.split('/').last, // Display only the file name
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
      ),
    ),
  );
}
