import 'dart:math';

import 'package:bid_bazaar/config/config.dart';
import 'package:bid_bazaar/pages/bidding-page.dart';
import 'package:bid_bazaar/pages/buy-page.dart';
import 'package:bid_bazaar/pages/notification-page.dart';
import 'package:bid_bazaar/pages/provider/localization_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import 'language_screen.dart';
import '../slider/slider-page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> randomNumbers =
      List.generate(15, (index) => Random().nextInt(100));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, child) {
      var selectedValue = localizationProvider.locale.languageCode;
      return Scaffold(
        appBar: AppBar(
          backgroundColor: bgAppBar,
          automaticallyImplyLeading: false,

          // leading: InkWell(
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //   child: const Icon(
          //     Icons.menu_outlined,
          //     color: Colors.white,
          //   ),
          // ),
          // title: Text(
          //   "Home Page",
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 20,
          //   ),
          // ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationPage()));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            // IconButton(
            //     onPressed: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return const LanguageScreen();
            //       }));
            //     },
            //     icon: const Icon(
            //       Icons.language,
            //       color: Colors.white,
            //       size: 30,
            //     )),
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.language,
                color: Colors.white,
                size: 30,
              ), // Shows an icon for the dropdown
              onSelected: (String newValue) {
                // Change locale on selection
                localizationProvider.setLocale(Locale(newValue));
              },
              itemBuilder: (BuildContext context) {
                return languageModel.map((item) {
                  return PopupMenuItem<String>(
                    value: item.languageCode,
                    child: Text('${item.language} (${item.subLanguage})'),
                  );
                }).toList();
              },
            ),
          ],
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          // color: Colors.red,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    child: Text(
                      S.of(context).gm,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                        color: bgBlack,
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      )),
                    ),
                  ),
                ],
              ),
              const Carousel(),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // Number of items per row
                    crossAxisSpacing: 10.0,
                    // Spacing between items horizontally
                    mainAxisSpacing: 10.0,
                    // Spacing between items vertically
                    childAspectRatio: 1.0, // Aspect ratio of each item
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Card.outlined(
                      // elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(
                              color: bgButton1, style: BorderStyle.solid)),
                      // color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BiddingPage()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://picsum.photos/400/200'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Melbourne Cricket',
                                    style: TextStyle(
                                      color: bgBlack,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "\$99",
                                      // Correct static string for displaying dollar amounts
                                      style: TextStyle(
                                        color: bgBlack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "ends in 30m",
                                          style: TextStyle(
                                            height: 0,
                                            color: bgAppBar,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: bgButton,
                                            borderRadius:
                                                BorderRadius.circular(9),
                                            // border:
                                            //     Border.all(color: Colors.black, width: 2),
                                          ),
                                          child: const Center(
                                            child: Padding(
                                              padding: EdgeInsets.all(2.0),
                                              child: Text(
                                                "Place Bid",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // Number of items per row
                    crossAxisSpacing: 10.0,
                    // Spacing between items horizontally
                    mainAxisSpacing: 10.0,
                    // Spacing between items vertically
                    childAspectRatio: 1.0, // Aspect ratio of each item
                  ),
                  itemCount: randomNumbers.length,
                  itemBuilder: (context, index) {
                    return Card.outlined(
                      // elevation: 12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              color: bgButton1, style: BorderStyle.solid)),
                      // color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BuyPage()));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://picsum.photos/400/200'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              // SizedBox(
                              //   height: 5,
                              // ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Melbourne Cricket',
                                    style: TextStyle(
                                      color: bgBlack,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Expanded(
                                    child: Text(
                                      "\$99",
                                      // Correct static string for displaying dollar amounts
                                      style: TextStyle(
                                        color: bgBlack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: bgButton,
                                        borderRadius: BorderRadius.circular(9),
                                        // border:
                                        //     Border.all(color: Colors.black, width: 2),
                                      ),
                                      child: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Text(
                                            "View",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
