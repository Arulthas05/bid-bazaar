import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../config/config.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  bool passToggle1 = true;
  late SharedPreferences prefs;
  bool _isLoading = false;

  Future<void> _changePassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? authToken = prefs.getString('token');
      // Send the POST request
      final response = await http.post(
        // Uri.parse("https://dev.kioskmode.co/api/user/changepassword"),
        Uri.parse(forgot),
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'Username': emailController.text,
          'OldPassword': passwordController.text,
          'NewPassword': newController.text,
        }),
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Password changed successfully
        // Clear text fields
        emailController.clear();
        passwordController.clear();
        newController.clear();

        // Show success message
        print('Success');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password changed successfully.'),
          ),
        );

        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(
        //     builder: (context) => HomePage(
        //       authToken: authToken!,
        //     ),
        //   ),
        // );

        // Navigate user to some other page if needed
        // Navigator.push(context, MaterialPageRoute(builder: (context) => SomePage()));
      } else {
        // Handle failure
        // Decode the response body
        Map<String, dynamic> data = jsonDecode(response.body);
        String message = data['message'];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      }
    } on FormatException catch (e) {
      // Handle format exception (invalid JSON)
      print('Format error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'An error occurred while processing the response. Please try again.'),
        ),
      );
    } catch (e) {
      // Handle other errors
      print('Error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0b0f23),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Change Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF90A4AE),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Color(0xFFec6400),
                          size: 20,
                        ),
                      ),
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
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
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
                        labelText: 'OldPassword',
                        labelStyle: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF90A4AE))),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xFFec6400),
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
                            color: passToggle
                                ? const Color(0xff90A4AE)
                                : const Color(0xff90A4AE),
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
                  const SizedBox(height: 25),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
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
                      controller: newController,
                      obscureText: passToggle1,
                      decoration: InputDecoration(
                        labelText: 'NewPassword',
                        labelStyle: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF90A4AE))),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock_outline_rounded,
                          color: Color(0xFFec6400),
                          size: 20,
                        ),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle1 = !passToggle1;
                            });
                          },
                          child: Icon(
                            passToggle1
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: passToggle1
                                ? const Color(0xff90A4AE)
                                : const Color(0xff90A4AE),
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
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: _isLoading ? null : _changePassword,
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFec6400),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: _isLoading
                          ? const Center(
                              child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: CircularProgressIndicator(
                                color: Color(0xFF0b0f23),
                              ),
                            ))
                          : Center(
                              child: Text(
                                "Change Password",
                                style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                        color: Color(0xFFFFFFFF))),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
