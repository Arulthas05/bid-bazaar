import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/config.dart'; // Import the config file where bgAppBar is defined
import '../drawer/drawer.dart';
import '../pages/explore-page.dart';
import '../pages/home-page.dart';
import '../pages/profile-page.dart';

class Bottom_Appbar extends StatefulWidget {
  const Bottom_Appbar({super.key});

  @override
  State<Bottom_Appbar> createState() => _Bottom_AppbarState();
}

class _Bottom_AppbarState extends State<Bottom_Appbar>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _animationController;

  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _animationController
          .forward()
          .then((_) => _animationController.reverse());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? ScaleTransition(
                    scale: Tween<double>(begin: 1.0, end: 1.2).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: Icon(Icons.shop_2, color: Colors.white),
                  )
                : Icon(Icons.shop_2_outlined, color: Colors.grey),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? ScaleTransition(
                    scale: Tween<double>(begin: 1.0, end: 1.2).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: Icon(Icons.camera, color: Colors.white),
                  )
                : Icon(Icons.camera_alt_outlined, color: Colors.grey),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? ScaleTransition(
                    scale: Tween<double>(begin: 1.0, end: 1.2).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: Icon(Icons.home, color: Colors.white),
                  )
                : Icon(Icons.home_outlined, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? ScaleTransition(
                    scale: Tween<double>(begin: 1.0, end: 1.2).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: Icon(Icons.person, color: Colors.white),
                  )
                : Icon(Icons.person_outline, color: Colors.grey),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white, // Active icon color
        unselectedItemColor: Colors.grey, // Inactive icon color
        backgroundColor: bgAppBar, // Keep the background color as bgAppBar
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedLabelStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
        onTap: _onItemTapped,
      ),
      drawer: const Drawer_Page(),
    );
  }
}
