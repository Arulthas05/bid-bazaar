import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../bottombar/bottombar.dart';
import '../config/config.dart';
import '../generated/l10n.dart';
import '../pages/home-page.dart';
import '../pages/provider/localization_provider.dart';
import '../utils/token_manager.dart'; // Import TokenManager
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool passToggle = true; // Define passToggle variable

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('$apiUrl/api/users/v1/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );

      print('API Response: ${response.body}');
      print('API Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('token') && data['token'] != null) {
          await TokenManager.saveToken(
              data['token']); // Save token using TokenManager

          // Navigate to the next page or show a success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login successful!'),
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Bottom_Appbar(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid response from server.'),
            ),
          );
        }
      } else {
        // Handle error response
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        final String errorMessage =
            errorData['msg'] ?? 'Login failed. Please try again.';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: bgWhite,
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
                      Text(
                        S.of(context).login_here,
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                                color: bgAppBar,
                                fontSize: 30,
                                fontWeight: FontWeight.w800)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        S.of(context).login_wc,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          color: bgBlack,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                      const SizedBox(
                        height: 60,
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
                                    color:
                                        bgAppBar), // Border color when focused
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot your password?",
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(color: bgAppBar)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: _isLoading ? null : _login,
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: bgButton,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: _isLoading
                              ? Center(
                                  child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: const CircularProgressIndicator(
                                    color: Color(0xFF0b0f23),
                                  ),
                                ))
                              : Center(
                                  child: Text(
                                    S.of(context).login,
                                    style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                            color: Color(0xFFFFFFFF))),
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
                              "${S.of(context).create_new}?",
                              style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                color: Color(0xFF1E1E1E),
                              )),
                            ),
                            onTap: () => {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => SignupPage(),
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
    });
  }
}
