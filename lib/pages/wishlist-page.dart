import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/config.dart';
import '../generated/l10n.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  final List<int> randomNumbers =
      List.generate(15, (index) => Random().nextInt(100));

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
        // leadingWidth: 0,
        // automaticallyImplyLeading: false,
        // title: PreferredSize(
        //     preferredSize: Size.fromHeight(40),
        //     child: Container(
        //       height: 40,
        //       width: 350,
        //       child: TextField(
        //         // controller: _searchController,
        //         onChanged: (value) {
        //           setState(() {}); // Update UI on search query change
        //         },
        //         decoration: InputDecoration(
        //           hintText: "Search",
        //           hintStyle: GoogleFonts.inter(
        //               textStyle: TextStyle(
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.bold,
        //                   color: Color(0xFF90A4AE))),
        //           prefixIcon: Icon(
        //             Icons.search,
        //             color: Color(0xFF90A4AE),
        //           ),
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(10),
        //             borderSide: BorderSide.none,
        //           ),
        //           fillColor: Color(0xFFFFFFFF),
        //           filled: true,
        //           contentPadding: EdgeInsets.symmetric(horizontal: 10),
        //         ),
        //       ),
        //     )),
        title: Text(
          S.of(context).wish_list,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     child: Icon(
        //       Icons.edit,
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
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: randomNumbers.length,
                shrinkWrap:
                    true, // Ensures the ListView uses only as much height as it needs
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card.outlined(
                    // elevation: 12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(
                            color: bgButton1, style: BorderStyle.solid)),
                    // color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  margin: const EdgeInsets.only(
                                      right: 15, bottom: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    // boxShadow: const [
                                    //   BoxShadow(
                                    //     color: Colors.black12,
                                    //     offset: Offset(0, 2),
                                    //     blurRadius: 4.0,
                                    //   ),
                                    // ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      imageUrl: "https://picsum.photos/400/200",
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Container(
                                        child: Image.asset(
                                          'assets/images/no-image.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        child: Image.asset(
                                          'assets/images/no-image.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      'formatTimeDifference',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: Colors.black),
                                    ),
                                    const Text(
                                      "\$99",
                                      style: TextStyle(
                                        color: bgBlack,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 150,
                                decoration: BoxDecoration(
                                  color: bgButton1,
                                  borderRadius: BorderRadius.circular(9),
                                  // border:
                                  //     Border.all(color: Colors.black, width: 2),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      "Buy",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
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
                                      "Remove",
                                      style: TextStyle(
                                        color: bgWhite,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300,
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
