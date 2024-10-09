import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config.dart';
import '../generated/l10n.dart';

class NotificationSetting extends StatefulWidget {
  const NotificationSetting({super.key});

  @override
  State<NotificationSetting> createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  final List<int> randomNumbers =
      List.generate(2, (index) => Random().nextInt(100));
  bool _isSwitched1 = false;
  bool _isSwitched2 = false;
  bool _isSwitched3 = false;
  bool _isSwitched4 = false;
  bool _isSwitched5 = false;
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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // color: Colors.red,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
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
                                  const Icon(Icons.message),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: Text(
                                        "Bidding Notifications",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          decorationColor: bgBlack,
                                        ),

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
                            child: CupertinoSwitch(
                              value: _isSwitched1,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched1 = value;
                                });
                              },
                              activeColor: Colors.green.shade900,
                              thumbColor: Colors.white,
                              trackColor: Colors.black12,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                  const Icon(Icons.message),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: Text(
                                        "New Item Notifications",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          decorationColor: bgBlack,
                                        ),

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
                            child: CupertinoSwitch(
                              value: _isSwitched2,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched2 = value;
                                });
                              },
                              activeColor: Colors.green.shade900,
                              thumbColor: Colors.white,
                              trackColor: Colors.black12,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                  const Icon(Icons.message),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: Text(
                                        "Offers",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          decorationColor: bgBlack,
                                        ),

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
                            child: CupertinoSwitch(
                              value: _isSwitched3,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched3 = value;
                                });
                              },
                              activeColor: Colors.green.shade900,
                              thumbColor: Colors.white,
                              trackColor: Colors.black12,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                  const Icon(Icons.message),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: Text(
                                        "Message from Sellers",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          decorationColor: bgBlack,
                                        ),

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
                            child: CupertinoSwitch(
                              value: _isSwitched4,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched4 = value;
                                });
                              },
                              activeColor: Colors.green.shade900,
                              thumbColor: Colors.white,
                              trackColor: Colors.black12,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                  const Icon(Icons.message),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                      ),
                                      child: Text(
                                        "Bid Status",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 20,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          decorationColor: bgBlack,
                                        ),

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
                            child: CupertinoSwitch(
                              value: _isSwitched5,
                              onChanged: (value) {
                                setState(() {
                                  _isSwitched5 = value;
                                });
                              },
                              activeColor: Colors.green.shade900,
                              thumbColor: Colors.white,
                              trackColor: Colors.black12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
