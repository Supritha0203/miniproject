import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:coverflow/coverflow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:mptest/models/onboardModels.dart';
import 'package:slider_controller/slider_controller.dart';
import 'models/onboardModels.dart';
import 'package:flutter/services.dart' as rootBundle;

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({super.key});

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final List<String> titles = [
    "a random logo",
    "a black round logo",
    "instagram logo",
    "twitter logo",
    "whatsapp logo",
  ];
  final List<Widget> images = [
    const SizedBox(
      width: 160.0,
      height: 200,
      child: Image(image: AssetImage('images/bla.jpg')),
    ),
    const SizedBox(
      width: 160.0,
      height: 200,
      child: Image(image: AssetImage('images/black.png')),
    ),
    const SizedBox(
      width: 160.0,
      height: 200,
      child: Image(image: AssetImage('images/ig.jpg')),
    ),
    const SizedBox(
      width: 160.0,
      height: 200,
      child: Image(image: AssetImage('images/twi.png')),
    ),
    const SizedBox(
      width: 160.0,
      height: 200,
      child: Image(image: AssetImage('images/wats.jpg')),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: FutureBuilder(
        builder: (context, data) {
          if (data.hasError) {
            return Text('${data.error}');
          } else if (data.hasData) {
            var items = data.data as List<onboardModels>;
            print(items);
            return CoverFlow(
              images: images,
              titles: titles,
              textStyle: const TextStyle(color: Colors.black, fontSize: 0.5),
              displayOnlyCenterTitle: false,
              onCenterItemSelected: (index) {
                print('Selected Item\'s index: $index');
              },
              shadowOpacity: 0.3,
              shadowOffset: const Offset(3, 8),
            );
            ;
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: ReadJsonData(),
      ),
    ));
  }

  Future<List<onboardModels>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle
        .loadString('jsonFile/onboardModelData.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => onboardModels.fromJson(e)).toList();
  }
}
