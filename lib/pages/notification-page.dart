import 'dart:math';

import 'package:bid_bazaar/pages/notification-settings.dart';
import 'package:bid_bazaar/pages/notification-view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config.dart';
import '../generated/l10n.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
        title: Text(
          S.of(context).notifications,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationSetting()));
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.settings,
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
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: randomNumbers.length,
                shrinkWrap:
                    true, // Ensures the ListView uses only as much height as it needs
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationView()));
                      },
                      child: Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          color: bgInput1,

                          // border:
                          //     Border.all(color: Colors.black, width: 2),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 8, bottom: 8),
                                      child: Row(
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                              ),
                                              child: Text(
                                                "Bidding Ended",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 20,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    decorationColor: bgBlack,
                                                    decoration: TextDecoration
                                                        .underline),

                                                maxLines: 2,

                                                overflow: TextOverflow
                                                    .ellipsis, // Add ellipsis if the text is too long
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      right: 5,
                                    ),
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: bgRed,
                                        borderRadius: BorderRadius.circular(50),
                                        // border:
                                        //     Border.all(color: Colors.black, width: 2),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "1",
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
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                children: [
                                  Text('Unfortunately, you lost the bid'),
                                ],
                              ),
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
  }
}
