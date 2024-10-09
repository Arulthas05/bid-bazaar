import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/config.dart';
import 'feedback.dart';
import 'wishlist-page.dart';
import 'post-add.dart';
import '../utils/token_manager.dart'; // Import TokenManager
import '../auth/login_page.dart'; // Import LoginPage for navigation after logout

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? userName; // Use nullable String
  String? userEmail;
  String? userProfile;

  @override
  void initState() {
    super.initState();
    locationController.text = "Pittugala, Malabe, Colombo";
    phoneController.text = "0766235675";

    // Initialize user details (or fetch from API)
    userName = "Hariyanne";
    userEmail = "hariyanne@example.com";
    userProfile = "https://picsum.photos/400/200"; // Example profile URL
  }

  Future<void> _logout(BuildContext context) async {
    await TokenManager.removeToken(); // Clear the token
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Logged out successfully!'),
      ),
    );
    // Navigate to the login page or any other appropriate page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(), // Replace with your login page
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgAppBar,
      appBar: AppBar(
        backgroundColor: bgAppBar,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 340,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      height: 260,
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: bgWhite),
                        ),
                        color: bgAppBar,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'name',
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    fontSize: 10,
                                    color: bgWhite,
                                  ),
                                ),
                              ),
                              Text(
                                userName ??
                                    'Loading...', // Fallback to 'Loading...' if null
                                style: GoogleFonts.inter(
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    color: bgWhite,
                                  ),
                                ),
                              ),
                              // Location input
                              TextFormField(
                                controller: locationController,
                                decoration: InputDecoration(
                                  hintText: 'Enter location',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: const Icon(Icons.home),
                                  suffixIcon: const Icon(Icons.edit_note),
                                ),
                                validator: (value) =>
                                    value!.isEmpty ? 'Enter a location' : null,
                              ),
                              const SizedBox(height: 13),
                              // Phone input
                              TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Phone',
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: const Icon(Icons.phone),
                                  suffixIcon: const Icon(Icons.edit_note),
                                ),
                                validator: (value) => value!.isEmpty
                                    ? 'Enter a phone number'
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Profile Image
                    Positioned(
                      bottom: 235,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: bgWhite,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: userProfile != null && userProfile!.isNotEmpty
                              ? Image.network(
                                  userProfile!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "assets/images/profile.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13),
              // Navigation containers (My Items and Post Ad)
              _buildMenuItem(context, "My items",
                  Icons.arrow_forward_ios_rounded, const WishList()),
              const SizedBox(height: 13),
              _buildMenuItem(context, "Post Ad",
                  Icons.arrow_forward_ios_rounded, const PostAdd()),
              const SizedBox(height: 13),
              // Add the logout button
              ElevatedButton(
                onPressed: () => _logout(context),
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String title, IconData icon, Widget destination) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destination));
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: bgAppBar,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: bgWhite),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                title,
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    color: bgWhite,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Icon(
                icon,
                color: bgWhite,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
