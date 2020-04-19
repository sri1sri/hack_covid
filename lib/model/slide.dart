import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    @required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'images/image1.jpg',
    title: 'Dedicated garage',
    description: 'You can avail emergency assistance services in any of our network garages. Services include towing on breakdown/accident, flat tyre, etc.',
  ),
  Slide(
    imageUrl: 'images/image2.jpg',
    title: 'Engine Protect',
    description: 'This add-on cover protects your engine from damages that are caused as a consequence of an accident.',
  ),
  Slide(
    imageUrl: 'images/image3.jpg',
    title: 'Garage Cash',
    description: 'A daily allowance is given to you for the number of days that your car is under repairs in the garage due to vehicle damages.',
  ),
];
