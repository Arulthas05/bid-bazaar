import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/config.dart';
import '../utils/token_manager.dart'; // Correct import for TokenManager
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  bool confirmToggle = true;
  bool checkbox = false;
  bool _isLoading = false;

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final String email = emailController.text;
      final String password = passwordController.text;
      final String phoneNumber = phoneController.text;

      try {
        final response = await http.post(
          Uri.parse('$apiUrl/api/users/v1/register'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'phoneNumber': phoneNumber,
            'password': password,
          }),
        );

        print('API Response: ${response.body}');
        print('API Response Status Code: ${response.statusCode}');

        if (response.statusCode == 201) {
          Map<String, dynamic> data = jsonDecode(response.body);

          if (data.containsKey('token') && data['token'] != null) {
            await TokenManager.saveToken(
                data['token']); // Save token using TokenManager
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Signup successful!')),
            );
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          } else {
            // Handle the case where the token is not present in the response
            print('Token not found in the response');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Signup failed: Token not found')),
            );
          }
        } else {
          // Handle non-201 status codes
          print('Failed to signup: ${response.body}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Signup failed: ${response.body}')),
          );
        }
      } catch (e) {
        // Handle network or other errors
        print('Error occurred during signup: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error occurred during signup: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgWhite,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Create Account',
                      style: GoogleFonts.inter(
                          textStyle:
                              const TextStyle(color: bgAppBar, fontSize: 30)),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: bgInput,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x1A000000),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: bgButton1)),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: bgAppBar), // Default border color
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: bgAppBar), // Border color when focused
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color:
                                      bgRed), // Border color when error occurs
                            ),
                            prefixIcon: const Icon(
                              Icons.person_outline,
                              color: bgAppBar,
                              size: 20,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name.';
                          }
                          return null; // Return null for no error
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: bgInput,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x1A000000),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: bgButton1)),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: bgAppBar), // Default border color
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: bgAppBar), // Border color when focused
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color:
                                      bgRed), // Border color when error occurs
                            ),
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: bgAppBar,
                              size: 20,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address.';
                          }
                          final emailRegExp = RegExp(
                            r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
                            caseSensitive: false,
                            multiLine: false,
                          );
                          if (!emailRegExp.hasMatch(value)) {
                            return 'Please enter a valid email address.';
                          }
                          return null; // Return null for no error
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: bgInput,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x1A000000),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: bgButton1)),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: bgAppBar), // Default border color
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: bgAppBar), // Border color when focused
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color:
                                      bgRed), // Border color when error occurs
                            ),
                            prefixIcon: const Icon(
                              Icons.phone_outlined,
                              color: bgAppBar,
                              size: 20,
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number.';
                          }
                          return null; // Return null for no error
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: bgInput,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x1A000000),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: bgButton1)),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: bgAppBar), // Default border color
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: bgAppBar), // Border color when focused
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: bgRed), // Border color when error occurs
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: bgAppBar,
                            size: 20,
                          ),
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
                              color: passToggle ? bgButton : bgButton,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password.';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: bgInput,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x1A000000),
                              blurRadius: 4,
                              spreadRadius: 0,
                              offset: Offset(0, 4))
                        ],
                      ),
                      child: TextFormField(
                        // style: const TextStyle(backgroundColor: bgAppBar),
                        controller: confirmPasswordController,
                        obscureText: confirmToggle,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          labelStyle: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: bgButton1)),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: bgAppBar), // Default border color
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: bgAppBar), // Border color when focused
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                color: bgRed), // Border color when error occurs
                          ),
                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                            color: bgAppBar,
                          ),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  confirmToggle = !confirmToggle;
                                });
                              },
                              child: Icon(
                                confirmToggle
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: passToggle ? bgButton : bgButton,
                              )),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password.';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long.';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match.';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: _isLoading ? null : _signup,
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: bgAppBar,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: _isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign Up',
                                  style: const TextStyle(
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            "Already have an account?",
                            style: GoogleFonts.inter(
                                fontSize: 10,
                                textStyle: const TextStyle(
                                  color: Color(0xFF1E1E1E),
                                )),
                          ),
                          onTap: () => {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            ),
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Text(
                            "Login Now",
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              textStyle: const TextStyle(color: bgAppBar),
                            ),
                          ),
                          onTap: () => {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            ),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
