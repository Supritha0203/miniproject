import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mptest/carousel.dart';
import 'package:mptest/misc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'models/carImage.dart';


class craouselImage extends StatefulWidget {
  const craouselImage({super.key});

  @override
  _craouselImage createState() => _craouselImage();
}

class _craouselImage extends State<craouselImage> {
  int activeIndex = 0;
  List<MyItem> items = [
    MyItem("item 1", 'images/black.png'),
    MyItem("item 2", 'images/twi.png'),
    MyItem("item 3", 'images/bla.jpg'),
    MyItem("item 4", 'images/wats.jpg'),
    MyItem("item 5", 'images/ig.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.black,
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          
          CarouselSlider.builder(
            itemCount: items.length,
            options: CarouselOptions(
              height: 400,              
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlayInterval: const Duration(seconds: 2),
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, realIndex) {
              final imgList = items[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: buildImage(imgList.path, index)),
                  const SizedBox(
                    height: 15,
                  ),
                  buildText(imgList.itemName, index),
                ],
              );
            },
          ),
          SizedBox(
            height: 50,
          ),
ElevatedButton(
  style: ElevatedButton.styleFrom(
   // maximumSize: Size(10, 10)

  ),
  onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>const Miscellaneous(),
                  ),
                );
              }, child: Text("Get Started ->"),
              
              ),
          //buildText(itemName, index),
          // buildText(),
        ],
      ),
    );
  }

  Widget buildImage(String imgList, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        color: Colors.black,
        child: Align(
          alignment: Alignment.center,
          child: Image.asset(
            imgList,
            fit: BoxFit.cover,
            
          ),
        ),
      );

  // buildIndicator() => AnimatedSmoothIndicator(
  //       activeIndex: activeIndex,
  //       count: items.length,
  //       effect: const JumpingDotEffect(
  //           dotColor: Colors.black,
  //           dotHeight: 15,
  //           dotWidth: 15,
  //           activeDotColor: Colors.red),
  //     );

  buildText(String itemName, int index) => Align(
      alignment: FractionalOffset.bottomCenter,
      child: Text(
        itemName,
        style: const TextStyle(
            fontWeight: FontWeight.w700, fontSize: 23, color: Colors.white),
      ));
}
