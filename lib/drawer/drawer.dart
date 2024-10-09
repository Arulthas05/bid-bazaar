import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawer_Page extends StatefulWidget {
  const Drawer_Page({super.key});

  @override
  State<Drawer_Page> createState() => _Drawer_PageState();
}

class _Drawer_PageState extends State<Drawer_Page> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(0), // Customize the border radius as needed
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF0E75C0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/logo1.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.center),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              children: [
                ListTile(
                  leading: const Icon(Icons.facebook),
                  iconColor: Colors.blue,
                  // title: const Text('Facebook'),
                  title: Transform.translate(
                    offset: const Offset(10, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Facebook',
                        style: TextStyle(
                          color: const Color(0xFF000000),
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          // decoration: TextDecoration.underline,
                          // decorationColor: Color(0xFF000000),
                          // decorationThickness: 2.0,
                        ),
                      ),
                    ),
                  ),
                  onTap: () =>
                      _launchURL('https://www.facebook.com/vithutrustfund'),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/youtube.svg',
                    width: 24,
                    height: 24,
                    color: Colors.red,
                  ),
                  iconColor: Colors.black,
                  title: Transform.translate(
                    offset: const Offset(10, 0),
                    child: Text(
                      'Youtube',
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),
                  onTap: () =>
                      _launchURL('https://www.youtube.com/@vithutrustfund1275'),
                ),
                ListTile(
                  leading: Image.asset(
                    'assets/images/twitter.png',
                    width: 18,
                    height: 18,
                  ),
                  // title: const Text('Twitter'),
                  title: Transform.translate(
                    offset: const Offset(10, 0),
                    child: Text(
                      'twitter',
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),
                  onTap: () => _launchURL('https://twitter.com/vithutrustfund'),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/instagram.svg',
                    width: 24,
                    height: 24,
                  ),
                  // title: const Text('Instagram'),
                  title: Transform.translate(
                    offset: const Offset(10, 0),
                    child: Text(
                      'Instagram',
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),
                  onTap: () =>
                      _launchURL('https://www.instagram.com/vithutrustfund/'),
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icons/linkedin.svg',
                    width: 24,
                    height: 24,
                  ),
                  iconColor: Colors.blue,
                  // title: const Text('e-Mail'),
                  title: Transform.translate(
                    offset: const Offset(10, 0),
                    child: Text(
                      'Linkedin',
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),

                  onTap: () => _launchURL(
                      'https://www.linkedin.com/company/vithu-trust-fund/'),
                ),
                ListTile(
                  leading: const Icon(Icons.language_rounded),
                  iconColor: Colors.blue,
                  // title: const Text('e-Mail'),
                  title: Transform.translate(
                    offset: const Offset(10, 0),
                    child: Text(
                      'vithu trust fund',
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ),

                  onTap: () => _launchURL('https://dev.vithu.org/'),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            width: double.infinity,
            height: 0.1,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            decoration: const BoxDecoration(
                // color: Colors.white,
                ),
            child: GestureDetector(
              child: Center(
                child: Text(
                  'Developed by: Loncey Tech',
                  style: TextStyle(
                      fontSize: 12,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
              ),
              onTap: () => _launchURL('https://lonceytech.com'),
            ),
          ),
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  // ignore: deprecated_member_use
  if (await launch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
