import 'dart:math';

import 'package:bid_bazaar/pages/payment-page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/config.dart';

class PostPreview extends StatefulWidget {
  const PostPreview({super.key});

  @override
  State<PostPreview> createState() => _PostPreviewState();
}

class _PostPreviewState extends State<PostPreview> {
  final List<int> randomNumbers =
      List.generate(2, (index) => Random().nextInt(100));

  // Controllers for each text field
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController multiValueController = TextEditingController();
  List<String> items = ['hii', 'duuuu'];

  List<String> availableItems = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Mango'
  ];
  List<String> selectedItems = [];

  String? selectedItem; // For single selection

  // Variable to store selected height
  String selectedHeight = 'Short'; // default
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgAppBar,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
        title: const Text(
          "PostPreview",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // color: Colors.red,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/400/200'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 0, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 0, bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  "Bidding Ended ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 23,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    decorationColor: bgBlack,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "by vender name",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on'),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentPage()));
                        },
                        child: Container(
                          height: 55,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgAppBar,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Return Home",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
