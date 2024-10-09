import 'dart:math';
import 'dart:ui';
import 'dart:convert'; // Add this import for JSON decoding
import 'package:http/http.dart' as http; // Add this import for HTTP requests

import 'package:bid_bazaar/config/config.dart';
import 'package:flutter/material.dart';

import '../slider/slider-page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import './model/location_model.dart'; // Ensure this import is correct

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final List<int> randomNumbers =
      List.generate(15, (index) => Random().nextInt(100));

  List<Location> _locations = [];
  bool _isLoading = true;
  String? selectedLocation;

  @override
  void initState() {
    super.initState();
    _fetchLocations();
  }

  Future<void> _fetchLocations() async {
    final response = await http.get(
        Uri.parse('$apiUrl/api/locations/v1')); // Replace with your API URL

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      List<dynamic> data = responseData['data'];
      setState(() {
        _locations =
            data.map((location) => Location.fromJson(location)).toList();
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load locations');
    }
  }

  void _showLocationList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: _locations.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_locations[index].name),
              onTap: () {
                setState(() {
                  selectedLocation = _locations[index].name;
                });
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }

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
              Icons.menu_outlined,
              color: Colors.white,
            ),
          ),
        ),
        title: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: SizedBox(
              height: 40,
              width: 350,
              child: TextField(
                onChanged: (value) {
                  setState(() {}); // Update UI on search query change
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.inter(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF90A4AE))),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF90A4AE),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color(0xFFFFFFFF),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 18,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card.outlined(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: const BorderSide(
                          color: bgButton1, style: BorderStyle.solid)),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.category_outlined),
                            Text(
                              'Category',
                              style: TextStyle(
                                color: bgBlack,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.unfold_more),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _showLocationList(
                      context), // Function to show the location list
                  child: Card.outlined(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(
                            color: bgButton1, style: BorderStyle.solid)),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.location_on_outlined),
                              Text(
                                'Location',
                                style: TextStyle(
                                  color: bgBlack,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.unfold_more),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of items per row
                  crossAxisSpacing: 10.0, // Spacing between items horizontally
                  mainAxisSpacing: 10.0, // Spacing between items vertically
                  childAspectRatio: 1.0, // Aspect ratio of each item
                ),
                itemCount: randomNumbers.length,
                itemBuilder: (context, index) {
                  return Card.outlined(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(
                            color: bgButton1, style: BorderStyle.solid)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Text(
                                  "\$99", // Correct static string for displaying dollar amounts
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
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
