import 'dart:math';

import 'package:bid_bazaar/pages/buy-page.dart';
import 'package:bid_bazaar/pages/payment-page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config.dart';
import 'notification-view.dart';

class BiddingPage extends StatefulWidget {
  const BiddingPage({super.key});

  @override
  State<BiddingPage> createState() => _BiddingPageState();
}

class _BiddingPageState extends State<BiddingPage> {
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
          "Bidding",
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
                      const Padding(
                        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Bidding end"),
                            Text("Price"),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "7hrs 45mins",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                decorationColor: bgBlack,
                              ),
                            ),
                            Text(
                              "\$99",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                decorationColor: bgBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              "Highest Bids",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                decorationColor: bgBlack,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person_3_rounded,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '\$99',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: Colors.black),
                                ),
                                const Text(
                                  "Alexs bis",
                                  style: TextStyle(
                                    color: bgBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: bgBlack,
                                borderRadius: BorderRadius.circular(50),
                                // border:
                                //     Border.all(color: Colors.black, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_circle_up_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person_3_rounded,
                              size: 30,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '\$99',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: Colors.black),
                                ),
                                const Text(
                                  "Alexs bis",
                                  style: TextStyle(
                                    color: bgBlack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: bgButton1,
                                borderRadius: BorderRadius.circular(50),
                                // border:
                                //     Border.all(color: Colors.black, width: 2),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_circle_down_sharp,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          _showEditDialog(context);
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
                              "Place Bid",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 25,
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

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 350,
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     color: Colors.pink,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: const Text(
                  //     "Edit Information",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Enter New bid",
                            hintText: "Enter New bid",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              (context),
                              MaterialPageRoute(
                                  builder: (context) => const PaymentPage()));
                        },
                        child: Container(
                          height: 50,
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: bgButton,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "Submit",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
