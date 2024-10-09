import 'dart:math';

import 'package:bid_bazaar/pages/notification-page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config.dart';
import 'feedback.dart';
import 'notification-view.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final List<int> randomNumbers =
      List.generate(2, (index) => Random().nextInt(100));

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
          "Payment",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()));
              },
              child: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // color: Colors.red,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 0, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 15),
                        child: Row(
                          children: [
                            Text(
                              "Congratulations ! Alexa bls ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                decorationColor: bgBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        height: 150,
                        width: 230,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://picsum.photos/400/200'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Vender Name",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                        maxLines:
                                            2, // Limit the text to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Add ellipsis if the text is too long
                                      ),
                                    ),
                                  ],
                                )),
                            Flexible(
                              child: Text(
                                "Jenny",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                maxLines: 2, // Limit the text to 2 lines
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if the text is too long
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Address",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                        maxLines:
                                            2, // Limit the text to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Add ellipsis if the text is too long
                                      ),
                                    ),
                                  ],
                                )),
                            Flexible(
                              child: Text(
                                "No1,KL street, London",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                maxLines: 2, // Limit the text to 2 lines
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if the text is too long
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "mail",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                        maxLines:
                                            2, // Limit the text to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Add ellipsis if the text is too long
                                      ),
                                    ),
                                  ],
                                )),
                            Flexible(
                              child: Text(
                                "jenny@gmail.com",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                maxLines: 2, // Limit the text to 2 lines
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if the text is too long
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "Phone",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                        maxLines:
                                            2, // Limit the text to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Add ellipsis if the text is too long
                                      ),
                                    ),
                                  ],
                                )),
                            Flexible(
                              child: Text(
                                "+ 101 3434 232 23",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                maxLines: 2, // Limit the text to 2 lines
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis if the text is too long
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        "\$99",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                        maxLines:
                                            2, // Limit the text to 2 lines
                                        overflow: TextOverflow
                                            .ellipsis, // Add ellipsis if the text is too long
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FeedBack()));
                        },
                        child: Container(
                          // height: 55,
                          width: 200,
                          decoration: BoxDecoration(
                              color: bgWhite,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: bgButton)),
                          child:
                              // Center(child: Icon(Icons.paypal_outlined)
                              Image.asset(
                            "assets/images/paypal2.png",
                            height: 45,
                            width: 200,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FeedBack()));
                        },
                        child: Container(
                          height: 45,
                          width: 200,
                          decoration: BoxDecoration(
                            color: bgAppBar,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Pay & Pick up",
                              style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 20,
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
