import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config.dart';
import '../generated/l10n.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
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
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     child: Icon(
        //       Icons.settings,
        //       color: Colors.white,
        //       size: 18,
        //     ),
        //   ),
        // ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // color: Colors.red,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: bgInput1,

                    // border:
                    //     Border.all(color: Colors.black, width: 2),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                Padding(
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
                                            GoogleFonts.poppins().fontFamily,
                                        decorationColor: bgBlack,
                                        decoration: TextDecoration.underline),

                                    maxLines: 2,

                                    overflow: TextOverflow
                                        .ellipsis, // Add ellipsis if the text is too long
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Text(
                            'Unfortunately, you lost the bid Unfortunately, you lost the bid Unfortunately, you lost the bid Unfortunately, you lost the bid'),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 16, right: 16, bottom: 16),
                        child: Text(
                            'Unfortunately, you lost the bid Unfortunately, you lost the bid Unfortunately, you lost the bid Unfortunately, you lost the bid'),
                      )
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
