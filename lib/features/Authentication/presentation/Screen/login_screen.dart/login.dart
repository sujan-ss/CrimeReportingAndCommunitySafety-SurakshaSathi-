// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, annotate_overrides, library_private_types_in_public_api, unused_local_variable, unused_label, dead_code, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/login_screen.dart/bloc/login_bloc.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/login_screen.dart/widgets/unverified.dart';
import 'package:suraksha_saathi/features/Authentication/presentation/Screen/login_signin_screen.dart';
import 'package:suraksha_saathi/features/Dashboard/Home/home.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<loginPage> {
  final formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
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
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginLoading) {
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
                  if (state is LoginFailure) {
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
                  } else if (state is LoginSuccess) {
                    if (state.verified) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      UnverifedScreen.showBottomSheet(context);
                    }
                  }
                }
              },
              child: Form(
                key: formField,
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return Column(
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
                            } else if (passController.text.length < 8) {
                              return "Password length must be at least 8 characters";
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
                              BlocProvider.of<LoginBloc>(context).add(
                                  FormSubmitEvent(
                                      email: emailController.text,
                                      password: passController.text));
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
                                "Log In",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
