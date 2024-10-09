import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late PageController _pageController;

  List<String> images = [
    "https://images.wallpapersden.com/image/download/purple-sunrise-4k-vaporwave_bGplZmiUmZqaraWkpJRmbmdlrWZlbWU.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        CarouselSlider(
          // Dynamically generating list of image containers
          items: images.map((url) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),

          // Carousel options
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: false,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ],
    );
    // return Column(
    //   children: [
    //     SizedBox(
    //       width: MediaQuery.of(context).size.width,
    //       height: 200,
    //       child: PageView.builder(
    //           itemCount: images.length,
    //           pageSnapping: true,
    //           controller: _pageController,
    //           onPageChanged: (page) {
    //             setState(() {
    //               activePage = page;
    //             });
    //           },
    //           itemBuilder: (context, pagePosition) {
    //             bool active = pagePosition == activePage;
    //             return slider(images, pagePosition, active);
    //           }),
    //     ),
    //     Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: indicators(images.length, activePage))
    //   ],
    // );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 5 : 5;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(images[pagePosition]),
          fit: BoxFit.cover,
        )),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
